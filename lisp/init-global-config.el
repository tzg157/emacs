;; init-global-config

(tool-bar-mode -1)       ;; 禁用工具条
(scroll-bar-mode -1)     ;; 禁用滚动条
;; (menu-bar-mode -1)       ;; 禁用菜单栏
(global-set-key [C-f6] 'global-linum-mode)    ;; 全局显示行号
(show-paren-mode t)      ;; 显示括号匹配
(setq inhibit-startup-message t)  ;; 禁用启动画面
(setq display-battery-mode t)   ;;???????????

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 交换buffer开始
(global-set-key (kbd "M-o")  'mode-line-other-buffer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 交换buffer结束

;;;;;;;;;; 跳到指定行
(global-set-key (kbd "C-c l") 'goto-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 最近打开开始
;(set-frame-font "Liberation Mono-13")
;(desktop-save-mode 1)
(setq desktop-restore-frames nil)
(desktop-save-mode 1)
;(switch-to-buffer "init.el")
;(delete-other-windows)
;(if window-system 
;	(desktop-save-mode 1))  ;; 打开emacs时，自动加载上次关闭时的buffer、major mode和位置等等
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 最近打开结束


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 显示时间开始

(setq display-time-24hr-format t)                       ;; 24小时制显示
(setq display-time-day-and-date t)                      ;; 显示日期与时间
(setq display-time-interval 1)                         ;; 设置时间更频率，单位暂时不知道（）
(setq display-time-format "%Y年%m月%d日%A%H:%M")        ;; 设置显示格式
(display-time-mode 1)                                   ;; mode-line显示时间

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 显示时间结束

(fset 'yes-or-no-p 'y-or-n-p)        ;; 用y-or-n替代yes-or-no

(setq x-select-enable-clipboard t)   ;; 允许外部程序的粘贴

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 实现全屏效果，快捷键为f6
(global-set-key [f6] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)
 
;; 最大化
(defun my-maximized ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;; 启动emacs时窗口最大化
(if window-system
	(my-maximized))
 
;; Change the indentation level
(setq-default c-basic-offset 4)
 
;; Change the style
(setq c-default-style "linux"
          c-basic-offset 4)
 
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;括号自动换行
(when (fboundp 'electric-pair-mode) 
(electric-pair-mode)) 
(when (eval-when-compile (version< "24.4" emacs-version)) 
(electric-indent-mode 1))



(provide 'init-global-config)
