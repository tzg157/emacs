;; init.el

;; 把lisp/目录添加到搜索路径中去

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list
  'load-path
  (expand-file-name "lisp" user-emacs-directory))

;; 下面每一个被require的feature都对应一个lisp/目录下的同名
;; elisp文件，例如：init-global-config、init-utils、init-elpa.el等
(require 'init-global-config) ;; 一些全局配置
(require 'init-utils)         ;; 加载一些自定义的函数、宏等
(require 'init-elpa)          ;; 加载ELPA，并定义
(require 'init-slime)         ;; 加载slime

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (tabbar paredit slime-company slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )