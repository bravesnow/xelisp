;������������ô���
;===============================================
;ColorTheme������ɫ
;(require 'molokai-theme)
;(setq molokai-theme-kit t);Just It doesn't work for Emacs24.3

(require 'color-theme);��һ�����⼯��
(color-theme-initialize);ʹ��ǰ��ʼ��
(color-theme-calm-forest);16�е�����
;(color-theme-subtle-hacker)
;===============================================
;Tabbar���ǩ
(require 'tabbar)
(tabbar-mode t)
;M-x tabbar-forward��   ��ת����һ���ɼ���tab
;M-x tabbar-backward��  ��ת��ǰһ���ɼ���tab
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)
(setq tabbar-buffer-groups-function nil);���ò�����
;����tabbar���  
;����Ĭ������: ����, ������ǰ����ɫ����С  
(set-face-attribute 'tabbar-default nil  
                    ;:family "DejaVu Sans Mono"  
                   :background "gray80"  
                   :foreground "gray30"  
                   :height 1.0)
;������߰�ť��ۣ�����ߴ�С����ɫ  
(set-face-attribute 'tabbar-button nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "yellow70"))  
;���õ�ǰtab��ۣ���ɫ�����壬����С����ɫ  
(set-face-attribute 'tabbar-selected nil  
                    :inherit 'tabbar-default  
                    :foreground "DarkGreen"  
                    :background "LightGoldenrod"  
		    :box '(:line-width 2 :color "DarkGoldenrod")  
                    :overline "black"  
                    :underline "black"  
                    :weight 'bold)    
;���÷ǵ�ǰtab��ۣ�����С����ɫ  
(set-face-attribute 'tabbar-unselected nil  
                    :inherit 'tabbar-default  
                   :box '(:line-width 2 :color "#00B2BF"))
;===============================================
;��ǿspeedbar�������������ڣ��ļ���
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 20)
(setq sr-speedbar-right-side nil) 
(global-set-key (kbd "<f1>") (lambda()
                                (interactive)
                                (sr-speedbar-toggle)))
;===============================================
;Yasnippet
(require 'yasnippet)
;(yas/global-mode 1)
(yas/initialize)
(yas/load-directory "~/site-lisp/yasnippet-0.6.1c/snippets")
;===============================================
;Auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/site-lisp/auto-complete-1.3/dict")
(ac-config-default)
;===============================================
(require 'python)
;===============================================
;Markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(setq auto-mode-alist
    (cons '("\\.md" . markdown-mode) auto-mode-alist))
;===============================================
;(require 'slime-autoloads)
;===============================================
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq-default TeX-master nil)
;(setq preview-scale-function 1.3)
;(setq LaTeX-math-menu-unicode t)
;(setq TeX-insert-braces nil)
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;(setq TeX-install-font-lock 'tex-font-setup)

(require 'tex-mode)
(defun my-latex-font-setup ()
  (set (make-local-variable 'font-lock-defaults)
       '((tex-font-lock-keywords tex-font-lock-keywords-1
                                 tex-font-lock-keywords-2 tex-font-lock-keywords-3)
         nil nil ((?$ . "\"")) nil
         (font-lock-mark-block-function . mark-paragraph)
         (font-lock-syntactic-face-function
          . tex-font-lock-syntactic-face-function)
         (font-lock-unfontify-region-function
          . tex-font-lock-unfontify-region))))
(setq TeX-install-font-lock 'my-latex-font-setup)
;======================================================
(provide 'plugin-config)