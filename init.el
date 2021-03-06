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
(require 'init-env)           ;; 设置环境
(require 'init-global-config) ;; 一些全局配置
(require 'init-utils)         ;; 加载一些自定义的函数、宏等
(require 'init-elpa)          ;; 加载ELPA，并定义
(require 'init-editing-utils) ;; 加载编辑工具，可匹配代码块

(require 'init-themes)        ;; 加载主题
(require 'init-slime)         ;; 加载slime
(require 'init-org)           ;; 加载org
(require 'init-ffip)          ;; 加载find-file-in-project配置
(require 'init-fci)           ;; 加载fill-column-indicator配置
(require 'init-company)       ;; 加载company配置
(require 'init-recentf)       ;; 加载recentf配置
(require 'init-helm)          ;; 加载helm配置
(require 'init-file-search)   ;; 加载查找文件关键字配置
;(require 'init-sessions)      ;; 加载session配置
(require 'init-neo-tree)      ;; 加载文件浏览器插件
(require 'init-ggtags)        ;; 加载gnu global tags配置
(require 'init-php)           ;; 加载php相关配置
(require 'init-git)           ;; 加载magit
(require 'init-github)        ;; 加载magithub
(require 'init-geben)         ;; 加载php调试
(require 'init-smartparens)   ;; 自动填充括号配置
(require 'init-mmm)      ;; multiple major mode 
;; (require 'init-eldoc)         ;; 加载eldoc，minibuffer提示
;; (require 'init-paredit)       ;; 加载parcell
(require 'init-tabbar)        ;; 加载tabbar配置
;;(require 'init-eclim)         ;; 加载eclim相关配置

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fill-column-indicator use-package tide tabbar smex smartparens psvn paredit-everywhere neotree mmm-mode magithub magit-svn highlight helm-git helm-dash ggtags geben-helm-projectile eldoc-extension eldoc-eval darcula-theme company-quickhelp autopair auto-highlight-symbol ac-slime ac-php ac-html ac-helm ac-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
