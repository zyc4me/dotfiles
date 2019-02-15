;; turn off startup message page
;; 关闭启动界面默认显示的消息
(setq inhibit-startup-message t)

;; 全局显示行号
(global-linum-mode 1) ; always show line numbers

;; 全局高亮当前行
(global-hl-line-mode t)

;; 设置缩进为4个空格宽度，而不是2个
(setq-default c-basic-offset 4)


;;关闭光标闪烁
;;终端下无效
;;(setq-default blink-cursor-mode 0)
;;(setq visible-cursor nil)

;;光标显示为竖杠
;;gnome-terminal下无效，因为terminal下光标是方块
;;(setq-default cursor-type 'bar)

;;括号自动配对
;;https://www.jianshu.com/p/d272e44c2e00
;;https://github.com/manateelazycat/awesome-pair
;;不是很好用：如果gdb配置了alt+方向键，就会相互冲突
;(add-to-list 'load-path "~/.emacs.d/awesome-pair") ; add awesome-pair to your load-path
;(require 'awesome-pair)
;(load "~/.emacs.d/auto_pair.el")

;; 括号自动配对，来自李杀的博客http://ergoemacs.org/emacs/emacs_insert_brackets_by_pair.html
;; auto close bracket insertion. New in emacs 24
;;" ' “” ‘’ () {} [] «»
(electric-pair-mode 1)

;; 配对括号高亮
(show-paren-mode 1)

;; set cc-mode, default style
;(add-hook 'c-mode-common-hook '(lambda()
;                 (c-ste-style "cc-mode")))

;;使用y or n提问
(fset 'yes-or-no-p 'y-or-n-p)

;用鼠标+ctrl键可以放大和缩小字体
;终端下无效
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)


;;gdb配置
;; from http://www.skywind.me/blog/archives/2036
;; ALT+方向键，用来在窗口之间跳转
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

 
;(global-set-key [f5] 'gud-run)
;(global-set-key [S-f5] 'gud-cont)
;(global-set-key [f6] 'gud-jump)
;(global-set-key [S-f6] 'gud-print)
;(global-set-key [f7] 'gud-step)
;(global-set-key [f8] 'gud-next)
;(global-set-key [S-f7] 'gud-stepi)
;(global-set-key [S-f8] 'gud-nexti)
;(global-set-key [f9] 'gud-break)
;(global-set-key [S-f9] 'gud-remove)
;(global-set-key [f10] 'gud-until)
;(global-set-key [S-f10] 'gud-finish)
 
;(global-set-key [f4] 'gud-up)
;(global-set-key [S-f4] 'gud-down)
 
(setq gdb-many-windows t)

