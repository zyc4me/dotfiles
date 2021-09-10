;; 禁用光标闪烁
(blink-cursor-mode 0)

;; 全局设定，显示行号
(global-linum-mode 1)

;; 全局设定，高亮当前行
(global-hl-line-mode t)

;; 关闭启动界面默认显示的消息
(setq inhibit-startup-message t)

;; 修改默认字体
;;'Ubuntu Mono', 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'
;;'Ubuntu Mono' 'Droid Sans Mono' 'monospace' monospace 'Droid Sans Fallback'
;; https://stackoverflow.com/a/65603103/2999096
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fcfcfc" :foreground "#232627" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 107 :width normal :family "'Ubuntu Mono' 'Droid Sans Mono' 'monospace' monospace 'Droid Sans Fallback'")))))
