;;;; init-ggtags

;;;; 开启ggtags-mode
(ggtags-mode)

;;;;; 全量更新
(defun gtags-root-dir ()
    "Returns GTAGS root directory or nil if doesn't exist."
    (with-temp-buffer
      (if (zerop (call-process "global" nil t nil "-pr"))
          (buffer-substring (point-min) (1- (point-max)))
        nil)))

  (defun gtags-update ()
    "Make GTAGS incremental update"
    (call-process "global" nil nil nil "-u"))

(defun gtags-update-hook-all ()
    (when (gtags-root-dir)
      (gtags-update)))
;;;;;;; 全量更新结束

;;;;;;; 单文件更新
(defun gtags-update-single(filename)  
      "Update Gtags database for changes in a single file"
      (interactive)
      (start-process
	   "update-gtags"
	   "update-gtags"
	   "bash" "-c"
	   (concat "cd " (gtags-root-dir)
			   " ; gtags --single-update "
			   filename )))

(defun gtags-update-current-file()
      (interactive)
      (defvar filename)
      (setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
      (gtags-update-single filename)
      (message "Gtags updated for %s" filename))

(defun gtags-update-hook()
      "Update GTAGS file incrementally upon saving a file"
      (when ggtags-mode
        (when (gtags-root-dir)
          (gtags-update-current-file))))
;;;;;; 单文件更新结束

(add-hook 'after-save-hook #'gtags-update-hook)
;;;;;;; 更新tags

(add-hook 'c-mode-common-hook
          (lambda ()
			(derived-mode-p 'c-mode 'c++-mode 'java-mode)
			(ggtags-mode 1)))


(provide 'init-ggtags)
