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
(defun x-indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
;======================================
;ѡ��ǰ��
(defun x-select-current-line ()
  "select current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line))
;ɾ����ǰ��
(defun x-delete-current-line ()
  "delete current line"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (kill-region (point) (mark)))
;==================================================
;;��ݼ���
(global-set-key (kbd "<f4>") 'x-compile);������
(global-set-key (kbd "<f5>") 'x-run);���п��
;======================================
;;��ǰ�������ļ���
(defun x-get-file-name()
  (file-name-nondirectory buffer-file-name))

;;========����Ӧ����(c��c++)
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
;;========����Ӧ���п�ִ���ļ�
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
;;========���Ա���
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
;;���ɱ�����ִ��
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
