;; init-tabbar

(global-set-key (kbd "C-M-j") 'tabbar-backward-tab)
(global-set-key (kbd "C-M-k") 'tabbar-forward-tab)

(require 'tabbar)
(tabbar-mode t)

(provide 'init-tabbar)
