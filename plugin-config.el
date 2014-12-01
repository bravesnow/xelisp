;==================================================
;el-get(https://github.com/dimitri/el-get/)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq package-enable-at-startup nil)
(package-initialize)
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
;=====================================================
;sublime-themes
(require 'emacs-color-themes)
(load-theme 'molokai t)
;(load-theme 'spolsky t)
;==================================================
;color-theme
;(require 'color-theme)
;(color-theme-midnight)
;===============================================
;yasnippet(https://github.com/capitaomorte/yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
;===============================================
;auto-complete(https://github.com/auto-complete/auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)
;================================================
;smooth-scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;================================================
;sr-speedbar
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 20)
(setq sr-speedbar-right-side nil) 
(global-set-key (kbd "<f1>") (lambda()
                                (interactive)
                                (sr-speedbar-toggle)))
;=================================================
;tabbar(https://github.com/dholm/tabbar)
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)]       'tabbar-forward)
(setq tabbar-buffer-groups-function nil);设置不分组 
(set-face-attribute 'tabbar-default nil   ;设置默认主题: 字体, 背景和前景颜色，大小  
                    ;:family "DejaVu Sans Mono"  
                   :background "gray80"  
                   :foreground "gray30"  
                   :height 1.0)
(set-face-attribute 'tabbar-button nil  ;设置左边按钮外观：外框框边大小和颜色 
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "yellow70"))  
(set-face-attribute 'tabbar-selected nil  ;设置当前tab外观：颜色，字体，外框大小和颜色
                    :inherit 'tabbar-default  
                    :foreground "DarkGreen"  
                    :background "LightGoldenrod"  
		    :box '(:line-width 2 :color "DarkGoldenrod")  
                    :overline "black"  
                    :underline "black"  
                    :weight 'bold)      
(set-face-attribute 'tabbar-unselected nil  ;设置非当前tab外观：外框大小和颜色
                    :inherit 'tabbar-default  
                   :box '(:line-width 2 :color "#00B2BF"))

;======================================================
(provide 'plugin-config)
