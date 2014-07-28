;第三方插件配置代码
;===============================================
;ColorTheme主题颜色
;(require 'molokai-theme)
;(setq molokai-theme-kit t);Just It doesn't work for Emacs24.3

(require 'color-theme);另一种主题集合
(color-theme-initialize);使用前初始化
(color-theme-calm-forest);16行的主题
;(color-theme-subtle-hacker)
;===============================================
;Tabbar多标签
(require 'tabbar)
(tabbar-mode t)
;M-x tabbar-forward：   跳转到下一个可见的tab
;M-x tabbar-backward：  跳转到前一个可见的tab
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)
(setq tabbar-buffer-groups-function nil);设置不分组
;设置tabbar外观  
;设置默认主题: 字体, 背景和前景颜色，大小  
(set-face-attribute 'tabbar-default nil  
                    ;:family "DejaVu Sans Mono"  
                   :background "gray80"  
                   :foreground "gray30"  
                   :height 1.0)
;设置左边按钮外观：外框框边大小和颜色  
(set-face-attribute 'tabbar-button nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "yellow70"))  
;设置当前tab外观：颜色，字体，外框大小和颜色  
(set-face-attribute 'tabbar-selected nil  
                    :inherit 'tabbar-default  
                    :foreground "DarkGreen"  
                    :background "LightGoldenrod"  
		    :box '(:line-width 2 :color "DarkGoldenrod")  
                    :overline "black"  
                    :underline "black"  
                    :weight 'bold)    
;设置非当前tab外观：外框大小和颜色  
(set-face-attribute 'tabbar-unselected nil  
                    :inherit 'tabbar-default  
                   :box '(:line-width 2 :color "#00B2BF"))
;===============================================
;增强speedbar——附在主窗口，文件栏
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