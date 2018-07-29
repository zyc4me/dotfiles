;;;
; most of the configuration comes from http://cestlaz.github.io/stories/emacs
; some from https://github.com/atilaneves/cmake-ide

;; part 0
;; turn off startup message page
(setq inhibit-startup-message t)

;; part 1
;; package management
;; I'm in P.R. China, so I'd like to use a mirror to acclerate connecting speed
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))

(when (version< emacs-version "27.0")
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; `try' is a package that enables me to try using a package without installation
(use-package try
  :ensure t)

;; `which-key' package gives hint when typing a prefix of a command
(use-package which-key
  :ensure t
  :config (which-key-mode))


;; part 2
;; A series of personal but very necessary settings.

;; hide tool-bar, since I treat emacs as a terminal editor
;; if there is GUI provided (such as X, Windows), I'll use IDE or VSCode
(tool-bar-mode -1)

;; turn off the blinking cursor.
;; It's annoying when stop typing code and thinking.
(blink-cursor-mode 0)

;; highlight current line
(global-hl-line-mode 1)

;; alwayse show line number
;; I think if an editor/IDE without line number is awful
(global-linum-mode t)


;; part 3
;; buffers/window/minibuffer management related packages
;; they are not necessary in theory, but brings convenience

;; when using `ido' package, it gives function usage in minibuffer
;; which is very helpful, i.e. avoiding explicit C-x f <fun name> a little bit
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; this would be very convenient for personal usage
(defalias 'list-buffers 'ibuffer-other-window)


;; C-c <-    previous buffer
;; C-c ->    next     buffer
(winner-mode 1)

;; `ace-window', this packages enables that:
;; C-x o,  will show numbers, so be convenient for choosing window
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))


;; `swiper' a minibuffer completion package
;; when typing M-x, minibuffer region will give completion information
;; `counsel' package is needed first by `swiper'
(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))


;; part 4
;; auto completion
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))


;; part 5
;; C++ coding configs

;; tags for code navigation
(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
  )

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

;; on the fly syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; snippets and snippet expansion
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))


;; Theme
(use-package color-theme
  :ensure t)
(use-package moe-theme
  :ensure t)
(moe-light)


(require 'rtags)
(cmake-ide-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rtags cmake-ide auto-complete swiper lorem-ipsum ace-window which-key use-package try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


