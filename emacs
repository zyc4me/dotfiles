;打开emacs不显示“帮助和文档”等信息
(setq inhibit-startup-message t)

;用鼠标+ctrl键可以放大和缩小字体
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)


;;下面是窗口的半透明效果的开启 
;;可以用来区分当前窗口和非当前窗口 
;;启动时自动开启窗口半透明效果 f10键用来切换 

(global-set-key (kbd "<f10>") 'loop-alpha) 
;当前窗口和非当前窗口时透明度 
(setq alpha-list '((90 70) (100 100))) 
(defun loop-alpha () 
(interactive) 
(let ((h (car alpha-list))) 
((lambda (a ab) 
(set-frame-parameter (selected-frame) 'alpha (list a ab)) 
(add-to-list 'default-frame-alist (cons 'alpha (list a ab)))) 
(car h) (car (cdr h))) 
(setq alpha-list (cdr (append alpha-list (list h)))))) 
;启动窗口时时自动开启窗口半透明效果 
(loop-alpha)

;;加入加载路径
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;启用主题
(load-theme 'molokai t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;中英文字体最好分别设定，我使用微软雅黑和Monaco字体
;required-at-runtime 
(eval-when-compile (require 'cl)) 
(when window-system 
  (defun set-font (english chinese english-size chinese-size) 
    (set-face-attribute 'default nil :font 
            (format "%s:pixelsize=%d" english english-size)) 
    (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
      (set-fontset-font t charset 
            (font-spec :family chinese)))) 

  (ecase system-type 
    (gnu/linux 
     (set-face-bold-p 'bold nil) 
     (set-face-underline-p 'bold nil) 
     (set-font "Monaco" "Droid Sans" 16 16)) 
    ))  



;;; **************************************************************************
;;; ***** built-in functions
;;; **************************************************************************
(defun eshell/cl () ;;clear可换其他名称
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
	;; simply delete the region
	(delete-region (point-min) (point-max))))



;;; Load multi-term.el
(load-file (expand-file-name "~/.emacs.d/multi-term.el"))
(require 'multi-term)

;;; Setup shell program for use with MultiTerm
(setq multi-term-program "/bin/bash")
