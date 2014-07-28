;==============================================
(setq user-full-name "bravesnow")
(setq user-mail-address "bravesnowxue@163.com")
;==============================================
(server-start);���������Emacs
;clientʱ��Ҫ����EMACS_SERVER_FILEΪserver�ĵ�ַ
;==============================================
;(set-default-font "Courier New-12");����Ĭ������
(set-default-font "-outline-Courier New-bold-normal-normal-mono-16-*-*-*-c-*-iso8859-1");;����Ĭ�������ֺ�

;(set-fontset-font "fontset-default"
; 'gb18030 '("Microsoft YaHei"."unicode-bmp"));������������΢���ź�
(set-fontset-font "fontset-default"
 'gb18030 '("SimSun"."unicode-bmp"));����������������
;==============================================
(setq inhibit-startup-message t);;�ر���������
(setq-default initial-scratch-message "");;scratch buffer�ÿ�
(setq-default make-backup-files nil);;�����������ļ�
(display-time-mode 1);;����ʱ����ʾ
;(setq display-time-24hr-format 1);ʱ��24Сʱ��
;(setq display-time-day-and-date 1);���ں;���ʱ��
(setq ring-bell-function 'ignore);�رշ�����ʾ��
(global-visual-line-mode 1);;ȥ�����е�С��ͷ
(setq-default cursor-type 'bar);;�����ʾΪһ����
(show-paren-mode t);; ��ʾƥ�������
(tool-bar-mode -1);;���ع�����
(global-linum-mode 1);��ʾ�к�,����ʹ��linum�����
(setq linum-format "%d");��ʾ�кŵĸ�ʽ
;(fset 'yes-or-no-p 'y-or-n-p);;�� y/n���� yes/no
(setq recentf-max-saved-items 10);recentf��������ļ����10��
(recentf-mode 1);������������ļ�
(add-hook 'org-mode-hook ;org-modeģʽ�£��Զ�����
	  (lambda () (setq truncate-lines nil)))
;===============================================
;; �����֣���Ĭ�Ϲ�����Ϊ3�� 
(defun up-slightly () (interactive) (scroll-up 3)) 
(defun down-slightly () (interactive) (scroll-down 3)) 
(global-set-key [mouse-4] 'down-slightly) 
(global-set-key [mouse-5] 'up-slightly)

;==============================================
;C/C++�������K&R
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")))
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))
(global-set-key (kbd "RET") 'newline-and-indent);��������
(setq c-basic-offset 4);���������ַ���
;===============================================





  

