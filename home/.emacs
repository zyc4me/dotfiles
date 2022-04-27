(load "~/.emacs.d/init_package.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(display-time-mode t)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(vscode-dark-plus-theme xr magit))
 '(show-paren-mode t))


;; 设置字体
;;system-type is a variable defined in `C source code'.
;; 判断系统的方法是读取 system-type 变量 (https://stackoverflow.com/questions/1817257/how-to-determine-operating-system-in-elisp)
; Its value is darwin

; Documentation:
; Value is symbol indicating type of operating system you are using.
; Special values:
;   `gnu'         compiled for a GNU Hurd system.
;   `gnu/linux'   compiled for a GNU/Linux system.
;   `darwin'      compiled for Darwin (GNU-Darwin, Mac OS X, ...).
;   `ms-dos'      compiled as an MS-DOS application.
;   `windows-nt'  compiled as a native W32 application.
;   `cygwin'      compiled using the Cygwin library.
; Anything else indicates some sort of Unix system.
(if (eq system-type 'gnu/linux)
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:family "YaHei Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 107 :width normal)))))
)

; 设置 C/C++ 风格， 覆盖默认风格。
; [emacs使用google-c-style](https://blog.csdn.net/csfreebird/article/details/9250989)
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/cpp"))
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; 设置回车键的功能。不做全局设置，仅对 C/C++ 模式起作用。
; (global-set-key (kbd "C-<return>") "\C-j \M-x indent-relative")
; (add-hook 'c++-mode-hook (kbd "<return>") 'newline)

;(defun my-run-some-commands ()
;  "Run `some-command' and `some-other-command' in sequence."
;  (interactive)
;  (newline)
;  ;(indent-rigidly-left)
;  (indent-relative))

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
; 感觉不太好用。。
;;             C  mode
; (add-hook 'c-mode-hook 'hs-minor-mode)
; (add-hook 'c++-mode-hook 'hs-minor-mode)
; (defun my-c-mode-auto-pair ()
;   (interactive)
;   (make-local-variable 'skeleton-pair-alist)
;   (setq skeleton-pair-alist  '(
;     (?` ?` _ "''")
;     (?\( ?  _ ")")
;     (?\[ ?  _ "]")
;     (?{ \n > _ \n ?} >)))
;   (setq skeleton-pair t)
;   (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;   (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;   (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
;   (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
; (add-hook 'c-mode-hook 'my-c-mode-auto-pair)
; (add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

; 不要生成备份文件
; https://wilkesley.org/~ian/xah/emacs/emacs_set_backup_into_a_directory.html
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;;;;;;;;;; C/C++ 代码缩进。 感觉一时半会儿配置不好了， 和现代编辑器的风格就完全不一样
; 缩进的全局配置。  TODO： makefile 文件怎么办？
(setq-default  tab-width 4) ;; 表示一个 tab 4个字符宽
(setq-default indent-tabs-mode nil) ;; nil 表示将 tab 替换成空格


; C++ 代码缩进， 自行定制版
; https://xhcoding.cn/post/20211222180104-emacs%E7%BC%A9%E8%BF%9B%E8%AE%BE%E7%BD%AE/
(c-add-style "my-style"
             ;'("stroustrup"
             '("awk"
               (indent-tabs-mode . nil)
               (c-basic-offset . 4)
               (c-offsets-alist
                (innamespace . -))
               ))

;(add-to-list 'c-default-style '(c++-mode . "my-style"))
;(add-to-list 'c-default-style '(c-mode . "my-style"))

(add-hook 'c-mode-common-hook 'my-style)
