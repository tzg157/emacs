;; init-tabbar

(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)

(require 'tabbar)
(tabbar-mode t)

(provide 'init-tabbar)
