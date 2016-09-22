;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(add-to-list 'load-path "~/.emacs.d/mylisp/")


(require 'package)
(require 'tabbar)
;;(require 'all-the-icons)
(package-initialize)

(scroll-bar-mode -1)
(setq default-cursor-type 'bar) 
(global-linum-mode t)
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.o
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (ecb projectile neotree company ztree ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/elpa/neotree/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;(setq neo-theme (if window-system 'icons 'arrow))
(load-file "~/.emacs.d/themes/dracula-theme.el")
(load-theme 'dracula t)
