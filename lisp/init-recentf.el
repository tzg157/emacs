;; init-recentf

;; (require 'recentf)
(recentf-mode 1)

(setq-default
 recentf-max-saved-items 1000
 recentf-exclude '("/tmp/" "/ssh:"))

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(provide 'init-recentf)
