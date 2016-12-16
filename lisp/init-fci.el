;;;; init-fci

(require 'fill-column-indicator)


;;;; configure
(setq fci-rule-column 120)

;;;;;;;;;;; add-hook for prog mode

(add-hook 'emacs-lisp-mode-hook (lambda ()
     (fci-mode 1)))

(add-hook 'php-mode-hook (lambda ()
     (fci-mode 1)))

(provide 'init-fci)
