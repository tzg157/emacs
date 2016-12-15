;(setq load-path (cons "/home/cjones/geben-0.26" load-path))
(require 'geben)

(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)

;; Debug a simple PHP script.
;; Change the session key my-php-56 to any session key text you like
(defun my-php-debug ()
  "Run current PHP script for debugging with geben"
  (interactive)
  (call-interactively 'geben)
  (shell-command
   (concat "XDEBUG_CONFIG='idekey=my-php-56' /opt/lampp/bin/ "
           (buffer-file-name) " &"))
  )

(global-set-key [f5] 'my-php-debug)

(provide 'init-geben)
