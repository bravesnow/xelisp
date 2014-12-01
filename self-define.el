;==============================================
;M+k快捷键关闭当前buffer
(global-set-key [(meta k)] (lambda () 
                             (interactive) 
                             (kill-buffer) 
                             (delete-window))) 
;关闭buffer时不提示
(remove-hook 'kill-buffer-query-functions
	'server-kill-buffer-query-function)
;==============================================
;Tab一键格式化函数
(defun x-indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
;======================================
;选择当前行
(defun x-select-current-line ()
  "select current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line))
;删除当前行
(defun x-delete-current-line ()
  "delete current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (kill-region (point) (mark)))
;==================================================
;;快捷键绑定
(global-set-key (kbd "<f4>") 'x-compile);编译快捷
(global-set-key (kbd "<f5>") 'x-run);运行快捷
;======================================
;;当前缓冲区文件名
(defun x-get-file-name()
  (file-name-nondirectory buffer-file-name))

;;========自适应编译(c与c++)
(defun smart-compile (filename)
  (interactive)
  (if (eq major-mode 'c-mode)
      (setq command
        (concat "gcc -Wall -g -std=c99 "
          filename " -o " (file-name-sans-extension filename))))

  (if (eq major-mode 'c++-mode)
      (setq command 
        (concat "g++ -Wall -g -std=c++11 "
          filename " -o " (file-name-sans-extension filename))))

  (if (not (null command))
    (compile command)
    (message "This file type cannot be compiled!"))
)
;;========自适应运行可执行文件
(defun smart-execution (filename)
  (interactive)
  (if (eq major-mode 'python-mode)
    (setq runcmd
      (concat "python "
			  (buffer-file-name)))
    (setq runcmd (concat 
			(file-name-sans-extension filename) ".exe")))

  (shell-command runcmd)
  (switch-to-buffer-other-window "*Shell Command Output*")
  (message "Finished!")
  )
;;========调试编译
(defun debug-compile (filename)
  (interactive)
  (if (eq major-mode 'c-mode)
	    (concat "gcc -Wall -g -DDebug -std=c99 "
		    filename " -o " (file-name-sans-extension filename)))

  (if (eq major-mode 'c++-mode)
      (setq command 
	    (concat "g++ -Wall -g -DDebug -std=c++11 "
		    filename " -o " (file-name-sans-extension filename))))

  (if (not (null command))
	(compile command)))
;===============================================
;;集成编译与执行
(defun x-debug ()
  (interactive)
  (debug-compile (x-get-file-name)))

(defun x-compile ()
  (interactive)
  (smart-compile (x-get-file-name)))

(defun x-run ()
  (interactive)
  (smart-execution (x-get-file-name)))

;================================
(provide 'self-define)
