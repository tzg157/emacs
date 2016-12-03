;;(setq inferior-lisp-program "/usr/bin/sbcl")
;;(add-to-list 'load-path "~/.emacs.d/elpa/slime/")
;;(require 'slime)
;;(slime-setup)

(dolist (p '("~/.emacs.d/lisp/" "~/.emacs.d/elpa/slime-20161102.711")) (push p load-path))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setf inferior-lisp-program "/usr/bin/sbcl")

(setq slime-contrib '(slime-fancy))

(require 'slime)

(provide 'init-slime)
