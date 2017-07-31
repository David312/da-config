;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(column-number-mode t)             ; Show column number in mode-line
(setq inhibit-startup-screen t) ;disables welcome screen on start
;(delete-selection-mode 1)          ; Delete selected region on write
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; checks if use-package is installed and installs it if it doesn't
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
;(setq use-package-verbose t)  ;; commented because leads to problems
(eval-when-compile
  (require 'use-package))


(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode t)  ;;enable global auto-complete
  ;; Activate auto-complete for latex modes (AUCTeX or Emacs' builtin one).
  (add-to-list 'ac-modes 'latex-mode)
  )

(use-package whitespace
  :ensure t
  :config
  (global-whitespace-mode t)  ; show whitespaces etc.
  (setq whitespace-style '(face lines-tail)
	whitespace-line-column 80) ; set max columns number (80 by default)
  
  )

(use-package yasnippet
  :ensure t
  )


(use-package markdown-mode
  :ensure t
  )

(use-package markdown-preview-eww
  :ensure t
  )


(use-package windmove
  :config
  ;; use shift + arrow keys to switch between visible buffers
  ;; (windmove-default-keybindings)
  )

(use-package elpy
  ;; :config
  ;; (eval-after-load 'elpy
  ;;   '(progn((elpy-enable))))
  )

(use-package flycheck
  :ensure t
  :config
  (add-hook 'c-mode-hook 'global-flycheck-mode) ;(global-flycheck-mode)
  (eval-after-load 'flycheck
    '(progn
       (use-package flycheck-cstyle
	 :config
	 (flycheck-cstyle-setup)
	 ;; chain after cppcheck since this is the last checker in the upstream
	 ;; configuration
	 (flycheck-add-next-checker 'c/c++-cppcheck '(warning . cstyle)))))
  )	     


(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;;activate rainbow-delimiter programming mode
  (add-hook 'ciao-mode-hook 'rainbow-delimiters-mode) ;;activate rainbow-delimiter ciao-mode
  )


(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode) ;enable undo-tree package globally
  )


(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  )
	     

(use-package auctex
  :ensure t
  :defer t
  :config
  (load "auctex.el" nil t t)
  (load "preview-latex.el" nil t t)
  )




(use-package web-mode
	     :config
	     (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
)


(use-package impatient-mode)

(use-package haskell-mode)
(use-package haskell-tab-indent)
(use-package haskell-snippets)

;; this does not work for some reason
;; (elpy-enable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "e9df267a1c808451735f2958730a30892d9a2ad6879fb2ae0b939a29ebf31b63" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (auctex bind-key dash diminish epl pkg-info popup yasnippet auto-complete-auctex auto-complete-c-headers flycheck rainbow-delimiters undo-tree use-package auto-complete)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; this must be place after Custom to load monokai
(load-theme 'monokai t)
