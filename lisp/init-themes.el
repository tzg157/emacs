(require 'use-package)
(require 'darcula-theme)

(use-package darcula-theme
	     :ensure t
	     :config
	     (set-frame-font "Inconsolata-14"))

(provide 'init-themes)
