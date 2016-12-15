;;;; init-eldoc



;;;;;;;;;;;; context help buffer *help* start
(defun rgr/toggle-context-help ()
  "Turn on or off the context help.
Note that if ON and you hide the help buffer then you need to
manually reshow it. A double toggle will make it reappear"
  (interactive)
  (with-current-buffer (help-buffer)
    (unless (local-variable-p 'context-help)
      (set (make-local-variable 'context-help) t))
    (if (setq context-help (not context-help))
	(progn
	   (if (not (get-buffer-window (help-buffer)))
	       (display-buffer (help-buffer)))))
    (message "Context help %s" (if context-help "ON" "OFF"))))

(defun rgr/context-help ()
  "Display function or variable at point in *Help* buffer if visible.
Default behaviour can be turned off by setting the buffer local
context-help to false"
  (interactive)
  (let ((rgr-symbol (symbol-at-point))) ; symbol-at-point http://www.emacswiki.org/cgi-bin/wiki/thingatpt%2B.el
    (with-current-buffer (help-buffer)
     (unless (local-variable-p 'context-help)
       (set (make-local-variable 'context-help) t))
     (if (and context-help (get-buffer-window (help-buffer))
         rgr-symbol)
       (if (fboundp  rgr-symbol)
           (describe-function rgr-symbol) 
	 (if (boundp  rgr-symbol) (describe-variable rgr-symbol)))))))

(defadvice eldoc-print-current-symbol-info
  (around eldoc-show-c-tag activate)
  (cond 
	((eq major-mode 'emacs-lisp-mode) (rgr/context-help) ad-do-it)
	((eq major-mode 'lisp-interaction-mode) (rgr/context-help) ad-do-it)
	((eq major-mode 'apropos-mode) (rgr/context-help) ad-do-it)
	(t ad-do-it)))

(global-set-key (kbd "C-c h") 'rgr/toggle-context-help)

;;;;;;;;;;;; context help buffer *help* end


;;; php-eldoc support start
(require 'xml)

(setq my-php-function-doc-hash (make-hash-table :test 'equal))


(defun my-php-fetch-function-doc (function)
  (let ((doc (gethash function my-php-function-doc-hash 'nope)))
    (when (eq doc 'nope)
      (setq doc nil)

      (let ((buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
        (with-current-buffer buf
          (goto-char (point-min))
          (let (desc)
            (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
              (setq desc
                    (replace-regexp-in-string
                     " +" " "
                     (replace-regexp-in-string
                      "\n" ""
                      (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))
              
              (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
                (setq desc
                      (concat desc "\n\n"
                              (replace-regexp-in-string
                               " +" " "
                               (replace-regexp-in-string
                                "\n" ""
                                (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))

            (if desc
                (setq doc (xml-substitute-special desc)))))

        (kill-buffer buf))

      (puthash function doc my-php-function-doc-hash))

    doc))


(defun my-php-eldoc-function ()
  (let ((symbol (thing-at-point 'symbol)))
    (if (and symbol
             (not (eq (elt symbol 0) ?$)))
        (my-php-fetch-function-doc symbol))))
;;;;; php eldoc support end




(provide 'init-eldoc)
