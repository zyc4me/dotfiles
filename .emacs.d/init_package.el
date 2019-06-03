					;--------------------
					; package management
					;--------------------
;; I'm in P.R. China, so I'd like to use a mirror to acclerate connecting speed
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))


(when (version< emacs-version "27.0")
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


					;--------------------
					; cuda mode
					;--------------------
(use-package cuda-mode
	     :ensure t)


					;--------------------
					; Theme
					;--------------------
(use-package monokai-theme
  :ensure t)
(require 'monokai-theme)
