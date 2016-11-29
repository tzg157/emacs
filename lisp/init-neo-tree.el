;(require 'neotree)

;;(neotree)

(global-set-key [f8] 'neotree-toggle)

(setq neo-smart-open t)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))
(define-key (current-global-map) (kbd "C-c C-p") 'neotree-project-dir)

;(add-hook 'after-init-hook
;		  (lambda ()
;			(interactive)
;			(progn
;			  (neotree-toggle)
;			  (switch-to-prev-buffer))))

;(message "buffer list." (buffer-list))
;(buffer-file-name)
;(neotree-dir "~/.emacs.d/")

;(define-key (current-local-map) (kbd "C-c C-p") 'neotree-project-dir)
;(add-hook 'after-init-hook #'neotree-toggle)


(provide 'init-neo-tree)
