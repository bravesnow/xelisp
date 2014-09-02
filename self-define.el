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
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;======================================
;选择当前行
(defun select-current-line ()
  "select current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line))
;删除当前行
(defun delete-current-line ()
  "delete current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (kill-region (point) (mark)))
;=================================
;;判断字符串是否存在给定缓冲区
(defun mysearch-buf-str (str bufstr)
  "search a given string in a given buffer"
  (with-current-buffer (get-buffer bufstr)
    (string-match str (buffer-string))))
;==================================================
;;快捷键绑定
(global-set-key (kbd "<f4>") 'mycompile);编译快捷
(global-set-key (kbd "<f5>") 'myrun);运行快捷

;======================================
;;当前缓冲区文件名
(defun getfilename()
  (file-name-nondirectory buffer-file-name))
;;自适应编译(c与c++)
(defun smart-compile (filename)
  ;;编译
  (interactive)
  ;;(setq split-width-threshold 0);垂直分割窗口
  (if (eq major-mode 'c-mode)
      (setq command
	    (concat "gcc -Wall -o "
		    (file-name-sans-extension filename)
		    " " filename " -g -std=c99")))
  (if (eq major-mode 'c++-mode)
      (setq command 
	    (concat "g++ -Wall -o "
		    (file-name-sans-extension filename)
		    " " filename " -g ")))
  (if (eq major-mode 'latex-mode)
      (setq command
	    (concat "xelatex " filename)))
  (if (not (null command))
	(compile command))
  ;(switch-to-buffer-other-window "*compilation*")
  ;;(setq split-width-threshold 160);还原水平分割
  )
;;自适应运行(.exe与.py)
(defun smart-execution (filename)
  ;;执行
  (interactive)
  ;;(setq split-width-threshold 0);垂直分割窗口
  (if (eq major-mode 'python-mode)
            (setq runcmd
		  (concat "python.exe "
			  (buffer-file-name)))
    (setq runcmd
	  (concat (file-name-sans-extension filename)
		  ".exe")))
  (shell-command runcmd)
  (switch-to-buffer-other-window "*Shell Command Output*")
  (message "Finished!")
  ;;(setq split-width-threshold 160);置还原
  )
;===============================================
;;集成编译与执行
(defun mycompile ()
  (interactive)
  (smart-compile (getfilename)))
(defun myrun ()
  (interactive)
  (smart-execution (getfilename)))
;================================
(provide 'self-define)




