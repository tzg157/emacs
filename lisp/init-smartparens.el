;;;; init-smartparens

(require 'smartparens-config)

(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'html-mode-hook #'smartparens-mode)
(add-hook 'php-mode-hook #'smartparens-mode)

(provide 'init-smartparens)
