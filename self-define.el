;==============================================
;M+k��ݼ��رյ�ǰbuffer
(global-set-key [(meta k)] (lambda () 
                             (interactive) 
                             (kill-buffer) 
                             (delete-window))) 
;�ر�bufferʱ����ʾ
(remove-hook 'kill-buffer-query-functions
	'server-kill-buffer-query-function)
;==============================================
;Tabһ����ʽ������
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;======================================
;ѡ��ǰ��
(defun select-current-line ()
  "select current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line))
;ɾ����ǰ��
(defun delete-current-line ()
  "delete current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (kill-region (point) (mark)))
;=================================
;;�ж��ַ����Ƿ���ڸ���������
(defun mysearch-buf-str (str bufstr)
  "search a given string in a given buffer"
  (with-current-buffer (get-buffer bufstr)
    (string-match str (buffer-string))))
;==================================================
;;��ݼ���
(global-set-key (kbd "<f4>") 'mycompile);������
(global-set-key (kbd "<f5>") 'myrun);���п��

;======================================
;;��ǰ�������ļ���
(defun getfilename()
  (file-name-nondirectory buffer-file-name))
;;����Ӧ����(c��c++)
(defun smart-compile (filename)
  ;;����
  (interactive)
  ;;(setq split-width-threshold 0);��ֱ�ָ��
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
  ;;(setq split-width-threshold 160);��ԭˮƽ�ָ�
  )
;;����Ӧ����(.exe��.py)
(defun smart-execution (filename)
  ;;ִ��
  (interactive)
  ;;(setq split-width-threshold 0);��ֱ�ָ��
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
  ;;(setq split-width-threshold 160);�û�ԭ
  )
;===============================================
;;���ɱ�����ִ��
(defun mycompile ()
  (interactive)
  (smart-compile (getfilename)))
(defun myrun ()
  (interactive)
  (smart-execution (getfilename)))
;================================
(provide 'self-define)




