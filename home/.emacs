;;----------------------------------------
;; 1. `;` 开头的行表示注释
;;----------------------------------------

;;==================================================
;; 1. 包管理
;;==================================================
;; 为了后续能使用 use-package
;;(require 'use-package)

;(load "~/.emacs.d/init_package.el")

;; melpa 包下载容易卡住， 设置代理
;; (with-eval-after-load 'gnutls
;;     (add-to-list 'gnutls-trustfiles "path/to/cert.crt"))
;; (setq url-proxy-services
;;    '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
;;      ("http" . "127.0.0.1:36219")
;;      ("https" . "127.0.0.1:36219")))


;; cd ~/work/github
;; git clone https://github.com/jwiegley/use-package
;; cp use-package/use-package.el ~/.emacs.d/

;; ;; This is only needed once, near the top of the file
;; (eval-when-compile
;;   ;; Following line is not needed if use-package.el is in ~/.emacs.d
;;   ;;(add-to-list 'load-path "<path where use-package is installed>")
;;   (require 'use-package))

;; (require 'package)
;; (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))
;; (eval-and-compile
;;   (setq use-package-always-ensure t
;;         use-package-expand-minimally t))
        

;; Basic Editing
;;==================================================
;;----------------------------------------
;; 1. 关掉光标闪烁
;;----------------------------------------
; 闪烁问题仅存在于 GUI 版本的 emacs 中
(blink-cursor-mode 0)

;;----------------------------------------
;; 2. 定制全局变量
;;----------------------------------------
;; 仅仅是全局开启。对于 dired 等情况，后续考虑关闭
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(global-display-line-numbers-mode t)
 '(global-hl-line-mode t)
 '(package-selected-packages
   '(treemacs-tab-bar treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs ranger use-package monokai-theme cuda-mode))
 '(show-paren-mode t))

;;--------------------------------------------------
;;　不要产生备份文件
;;--------------------------------------------------
; https://wilkesley.org/~ian/xah/emacs/emacs_set_backup_into_a_directory.html
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;;--------------------------------------------------
;; 使用y or n提问，取代yes or no，避免多打字
;;--------------------------------------------------
(fset 'yes-or-no-p 'y-or-n-p)

;;--------------------------------------------------
;; 设置字体
;;--------------------------------------------------
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
    '(default ((t (:family "Microsoft YaHei Mono" :foundry "MS  " :slant normal :weight normal :height 99 :width normal))))
)


;; 中英文字体最好分别设定，我使用微软雅黑和Monaco字体
;; required-at-runtime 
;; (eval-when-compile (require 'cl)) 
;; (when window-system 
;;   (defun set-font (english chinese english-size chinese-size) 
;;     (set-face-attribute 'default nil :font 
;;             (format "%s:pixelsize=%d" english english-size)) 
;;     (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
;;       (set-fontset-font t charset 
;;             (font-spec :family chinese)))) 

;;   (ecase system-type 
;;     (gnu/linux 
;;      (set-face-bold-p 'bold nil) 
;;      (set-face-underline-p 'bold nil) 
;;      (set-font "Monaco" "Droid Sans" 16 16)) 
;;     ))  


;;--------------------------------------------------
;; 用鼠标+ctrl键可以放大和缩小字体
;;--------------------------------------------------
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)


;;==================================================
;; C/C++
;;==================================================

;;----------------------------------------
;; 1. C++ 代码高亮
;;----------------------------------------
;; 在终端 Konsole 里，颜色几乎没变化
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/cpp"))
;; (require 'modern-cpp-font-lock)
;; (modern-c++-font-lock-global-mode t)

;; cd ~/work/github
;; git clone https://github.com/ianyepan/vscode-dark-plus-emacs-theme
;; cd vscode-dark-plus-emacs-theme
;; mkdir -p ~/.emacs.d/themes
;; cp vscode-dark-plus-theme.el ~/.emacs.d/themes/
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'vscode-dark-plus t)

;;----------------------------------------
; 设置 C/C++ 风格， 覆盖默认风格。
;;----------------------------------------
; [emacs使用google-c-style](https://blog.csdn.net/csfreebird/article/details/9250989)
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/cpp"))
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; 设置回车键的功能。不做全局设置，仅对 C/C++ 模式起作用。
; (global-set-key (kbd "C-<return>") "\C-j \M-x indent-relative")
; (add-hook 'c++-mode-hook (kbd "<return>") 'newline)



;;==================================================
;; Layout, Window Mangement
;;==================================================

;;----------------------------------------
;; 1. Dired enhancements
;;----------------------------------------

(use-package dired
  :ensure nil
  :hook ((dired-mode . dired-hide-details-mode)
         (dired-mode . hl-line-mode))
  :config
  (setq dired-listing-switches "-lat") ; sort by date (new first)
  (setq dired-kill-when-opening-new-dired-buffer t)
  (put 'dired-find-alternate-file 'disabled nil))

;; (use-package ranger
;;   :config
;;   (setq ranger-width-preview 0.5)
;;   (setq ranger-width-parents 0.167)
;;   (setq ranger-preview-delay 0.02)
;;   (setq ranger-show-hidden t)
;;   (define-key ranger-mode-map (kbd "i") #'dired-toggle-read-only)
;;   (define-key ranger-mode-map (kbd "C-h") nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;;----------------------------------------
;; 启动的时候， 纵向划分为两栏， 而不是横向划分两栏
;;----------------------------------------
;;(add-hook 'after-init-hook #'split-window-horizontally)


;;----------------------------------------
;; 窗口划分
;;----------------------------------------
(define-key global-map (kbd "C-x |") #'split-window-horizontally)
(define-key global-map (kbd "C-x -") #'split-window-vertically)

;;----------------------------------------
;; CMake 语法高亮
;;----------------------------------------
(setq load-path (cons (expand-file-name "/home/zz/.emacs.d/syntax-highlight") load-path))
(require 'cmake-mode)
