(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes nil)
 '(display-time-mode t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (xr magit)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; 设置 C/C++ 风格， 覆盖默认风格。
; [emacs使用google-c-style](https://blog.csdn.net/csfreebird/article/details/9250989)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/cpp"))
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; 设置回车键的功能。不做全局设置，仅对 C/C++ 模式起作用。
; (global-set-key (kbd "C-<return>") "\C-j \M-x indent-relative")
; (add-hook 'c++-mode-hook (kbd "<return>") 'newline)

(defun my-run-some-commands ()
  "Run `some-command' and `some-other-command' in sequence."
  (interactive)
  (newline)
  ;(indent-rigidly-left)
  (indent-relative))

;(global-set-key (kbd "C-c") 'my-run-some-commands)
;(add-hook 'c++-mode-hook (kbd "<return>") 'my-run-some-commands)
;(global-set-key (kbd "<return>") 'my-run-some-commands)
;(defun set-newline-and-indent ()
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'c-mode-hook 'set-newline-and-indent)


;(add-hook 'c++-mode-hook
;	  '(lambda ()
;	     (c-set-style "awk")))


; 自动补全结束的括号、引号
; https://codeantenna.com/a/QE1PAzWlBF
;;             C  mode
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ ")")
    (?\[ ?  _ "]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)


