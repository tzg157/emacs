(require 'eclim)
(require 'eclimd)
(require 'company)
(require 'company-emacs-eclim)

(global-eclim-mode)

;;------------------------------------------------------------
;; display compiler error
;;------------------------------------------------------------
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)


;;-------------------------------------------------------------
;; add companmy eclime
;;-------------------------------------------------------------
(company-emacs-eclim-setup)
;;(company-emacs-eclim-ignore-case)  ;;忽略大小写，默认company大小写敏感
(global-company-mode t)



(provide 'init-eclim)
