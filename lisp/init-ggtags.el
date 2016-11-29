
(add-hook 'c-mode-common-hook
          (lambda ()
			(derived-mode-p 'c-mode 'c++-mode 'java-mode)
			(ggtags-mode 1)))


(provide 'init-ggtags)
