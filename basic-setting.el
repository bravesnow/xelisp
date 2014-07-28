;==============================================
(setq user-full-name "bravesnow")
(setq user-mail-address "bravesnowxue@163.com")
;==============================================
(server-start);启动服务端Emacs
;client时需要设置EMACS_SERVER_FILE为server的地址
;==============================================
;(set-default-font "Courier New-12");设置默认字体
(set-default-font "-outline-Courier New-bold-normal-normal-mono-16-*-*-*-c-*-iso8859-1");;设置默认字体字号

;(set-fontset-font "fontset-default"
; 'gb18030 '("Microsoft YaHei"."unicode-bmp"));设置中文字体微软雅黑
(set-fontset-font "fontset-default"
 'gb18030 '("SimSun"."unicode-bmp"));设置中文字体宋体
;==============================================
(setq inhibit-startup-message t);;关闭启动画面
(setq-default initial-scratch-message "");;scratch buffer置空
(setq-default make-backup-files nil);;不产生备份文件
(display-time-mode 1);;启用时间显示
;(setq display-time-24hr-format 1);时间24小时制
;(setq display-time-day-and-date 1);日期和具体时间
(setq ring-bell-function 'ignore);关闭蜂鸣提示音
(global-visual-line-mode 1);;去掉换行的小箭头
(setq-default cursor-type 'bar);;光标显示为一竖线
(show-paren-mode t);; 显示匹配的括号
(tool-bar-mode -1);;隐藏工具栏
(global-linum-mode 1);显示行号,不用使用linum插件了
(setq linum-format "%d");显示行号的格式
;(fset 'yes-or-no-p 'y-or-n-p);;以 y/n代表 yes/no
(setq recentf-max-saved-items 10);recentf最近访问文件最多10个
(recentf-mode 1);开启最近访问文件
(add-hook 'org-mode-hook ;org-mode模式下，自动换行
	  (lambda () (setq truncate-lines nil)))
;===============================================
;; 鼠标滚轮，把默认滚动改为3行 
(defun up-slightly () (interactive) (scroll-up 3)) 
(defun down-slightly () (interactive) (scroll-down 3)) 
(global-set-key [mouse-4] 'down-slightly) 
(global-set-key [mouse-5] 'up-slightly)

;==============================================
;C/C++缩进风格K&R
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")))
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))
(global-set-key (kbd "RET") 'newline-and-indent);换行缩进
(setq c-basic-offset 4);设置缩进字符数
;===============================================





  

