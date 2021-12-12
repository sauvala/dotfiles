;;; init.el -*- lexical-binding: t ; eval: (view-mode -1) -*-

(setq native-comp-async-report-warnings-errors nil)
(add-to-list 'native-comp-eln-load-path (expand-***REMOVED***le-name "eln-cache/" user-emacs-directory))

;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
(setq user-emacs-directory (expand-***REMOVED***le-name "~/.cache/emacs/")
    url-history-***REMOVED***le (expand-***REMOVED***le-name "url/history" user-emacs-directory))

;; Use no-littering to automatically set common paths to the new user-emacs-directory
(use-package no-littering)

;; Keep customization settings in a temporary ***REMOVED***le (thanks Ambrevar!)
;(setq custom-***REMOVED***le
;    (if (boundp 'server-socket-dir)
;        (expand-***REMOVED***le-name "custom.el" server-socket-dir)
;    (expand-***REMOVED***le-name (format "emacs-custom-%s.el" (user-uid)) temporary-***REMOVED***le-directory)))
;(load custom-***REMOVED***le t)

(use-package exec-path-from-shell
  :defer 1
  :con***REMOVED***g
  (cond ((daemonp) (exec-path-from-shell-initialize))
        ((memq window-system '(mac ns x)) (exec-path-from-shell-initialize))))

(setq mac-right-option-modi***REMOVED***er 'nil
      mac-option-modi***REMOVED***er 'super
      mac-command-modi***REMOVED***er 'meta
      ns-function-modi***REMOVED***er 'hyper
      x-select-enable-clipboard t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-M-u") 'universal-argument)

(defun js/evil-hook ()
  (dolist (mode '(custom-mode
                  eshell-mode
                  git-rebase-mode
                  erc-mode
                  circe-server-mode
                  circe-chat-mode
                  circe-query-mode
                  sauron-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

(use-package evil-snipe
  :defer 0.5
  :con***REMOVED***g
  (evil-snipe-mode +1))

(use-package evil
  :defer 1
  :init
  ;; these two needs to be set for evil-collection
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)

  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-tree)
  (setq evil-want-***REMOVED***ne-undo t)
  (setq evil-visual-state-cursor 'hollow)
  :custom
  (evil-want-minibuffer t)
  :con***REMOVED***g
  (add-hook 'evil-mode-hook 'js/evil-hook)
  (evil-mode 1)
  (de***REMOVED***ne-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (de***REMOVED***ne-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (de***REMOVED***ne-key evil-normal-state-map (kbd "H-i") 'evil-jump-forward)
  (de***REMOVED***ne-key evil-normal-state-map (kbd "C-M-s-i") 'evil-jump-forward)
  (de***REMOVED***ne-key evil-normal-state-map (kbd "H-o") 'evil-jump-backward)
  (de***REMOVED***ne-key evil-normal-state-map (kbd "C-M-s-o") 'evil-jump-backward)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t) 
  :con***REMOVED***g
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :con***REMOVED***g
  (global-evil-surround-mode 1))

(use-package which-key
  ;; :init 
  :diminish which-key-mode
  :hook (emacs-startup . (lambda () (which-key-mode)))
  :con***REMOVED***g
  (setq which-key-idle-delay 0.3))

(use-package general
  :defer 0.1
  :con***REMOVED***g
  (general-evil-setup t)

  (general-create-de***REMOVED***ner js/leader-key-def
    :keymaps '(normal insert visual emacs)
    :pre***REMOVED***x "SPC"
    :global-pre***REMOVED***x "s-SPC"))

(use-package use-package-chords
  :disabled
  :con***REMOVED***g (key-chord-mode 1))

(js/leader-key-def
      "f"   '(:ignore t :which-key "***REMOVED***les")
      "ff"  '(***REMOVED***nd-***REMOVED***le :which-key "open ***REMOVED***le")
      "fs"  'save-buffer
      "fr"  '(consult-recent-***REMOVED***le :which-key "recent ***REMOVED***les")
      "fR"  '(revert-buffer :which-key "revert ***REMOVED***le")
      "b"   '(:ignore t :which-key "buffers")
      "bb"  '(consult-buffer :which-key "list buffers")
      "bl"  '(consult-buffer :which-key "list buffers"))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq use-dialog-box nil)

(column-number-mode)

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq visible-bell nil)
(use-package modus-themes
  :hook (emacs-startup . (lambda () (modus-themes-load-vivendi)))
  :con***REMOVED***g
  ;; Add all your customizations prior to loading the themes
  ;;   (setq modus-themes-italic-constructs t
  ;;         modus-themes-bold-constructs nil
  ;;         modus-themes-region '(bg-only no-extend))

  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-subtle-line-numbers t
        modus-themes-intense-markup nil
        modus-themes-success-deuteranopia nil
        modus-themes-tabs-accented nil
        modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related

        modus-themes-fringes nil ; {nil,'subtle,'intense}

        ;; Options for `modus-themes-lang-checkers' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `straight-underline', `text-also', `background',
        ;; `intense' OR `faint'.
        modus-themes-lang-checkers nil

        ;; Options for `modus-themes-mode-line' are either nil, or a
        ;; list that can combine any of `3d' OR `moody', `borderless',
        ;; `accented', `padded'.
        modus-themes-mode-line '(borderless padded) ; For Moody, also check `prot-moody'

        ;; This one only works when `modus-themes-mode-line' (above) has
        ;; the `padded' property.  It takes a positive integer.
        modus-themes-mode-line-padding 2

        ;; Options for `modus-themes-syntax' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `faint', `yellow-comments', `green-strings', `alt-syntax'
        modus-themes-syntax '(faint)

        ;; Options for `modus-themes-hl-line' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `accented', `underline', `intense'
        modus-themes-hl-line nil ;;'(accented)

        ;; Options for `modus-themes-paren-match' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `bold', `intense', `underline'
        modus-themes-paren-match '(bold)

        ;; Options for `modus-themes-links' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
        ;; `bold', `italic', `background'
        modus-themes-links nil

        ;; Options for `modus-themes-prompts' are either nil (the
        ;; default), or a list of properties that may include any of
        ;; those symbols: `background', `bold', `gray', `intense',
        ;; `italic'
        modus-themes-prompts '(bold italic)

        modus-themes-completions 'opinionated ; {nil,'moderate,'opinionated}

        modus-themes-mail-citations 'faint ; {nil,'faint,'monochrome}

        ;; Options for `modus-themes-region' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `no-extend', `bg-only', `accented'
        modus-themes-region '(no-extend accented)

        ;; Options for `modus-themes-diffs': nil, 'desaturated,
        ;; 'bg-only, 'deuteranopia, 'fg-only-deuteranopia
        modus-themes-diffs 'desaturated

        modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background} (also read doc string)

        ;; This is an alist: read the manual or its doc string.
        modus-themes-org-agenda
        '((header-block . (variable-pitch scale-title))
          (header-date . (bold-today scale-heading ))
          (event . (accented italic))
          (scheduled . uniform)
          (habit . traf***REMOVED***c-light-deuteranopia))

        ;; This is an alist: read the manual or its doc string.
        ;; modus-themes-headings nil
        ;; '((1 . (overline))
        ;;   (2 . (overline))
        ;;   (3 . (rainbow overline))
        ;;   (t . (rainbow no-bold overline)))
        ;;
        ;; '((t . (no-bold background overline)))

        ;; modus-themes-variable-pitch-ui nil
        ;; modus-themes-variable-pitch-headings nil
        ;; modus-themes-scale-headings nil
        ;; modus-themes-scale-1 1.1
        ;; modus-themes-scale-2 1.15
        ;; modus-themes-scale-3 1.21
        ;; modus-themes-scale-4 1.27
        ;; modus-themes-scale-title 1.33
        ;; modus-themes-scale-small 0.9
        )

  ;; Load the theme ***REMOVED***les before enabling a theme
  (modus-themes-load-themes)
  ;; (modus-themes-load-vivendi) ;; OR (modus-themes-load-vivendi)
  ;; :con***REMOVED***g
  ;; Load the theme of your choice:
  )

(use-package doom-themes
  :con***REMOVED***g
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-con***REMOVED***g)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-con***REMOVED***g)
  ;; Corrects (and improves) org-mode's native fonti***REMOVED***cation.
  (doom-themes-org-con***REMOVED***g))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(setq fancy-splash-image (concat default-directory ".emacs.d/img/emacs-e-1-smaller.svg"))

(use-package emojify
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)

(use-package mood-line
  :hook (after-init . mood-line-mode))

(defun js/doom-modeline--font-height ()
  "Calculate the actual char height of the mode-line."
  (+ (frame-char-height) 2))

(advice-add #'doom-modeline--font-height :override #'js/doom-modeline--font-height)

(use-package minions
  :after doom-modeline
  :hook (doom-modeline-mode . minions-mode))

(use-package diminish)

(add-hook 'emacs-startup-hook (lambda ()
                                (recentf-mode 1)
                                (setq recentf-max-menu-items 25)
                                (setq recentf-max-saved-items 25)
                                (run-at-time nil (* 5 60) 'recentf-save-list)))

(defun js/reload-init ()
  "Reload init.el."
  (interactive)
  (message "Reloading init.el...")
  (load user-init-***REMOVED***le nil 'nomessage)
  (message "Reloading init.el... done."))

(use-package restart-emacs
  :general
  (js/leader-key-def
    "q"   '(:ignore t :which-key "quit")
    "qq"  '(save-buffers-kill-emacs :which-key "quit emacs")
    "qR"  'restart-emacs
    "qc"  '(delete-frame :which-key "close emacsclient")
    "qr"  '(js/reload-init :which-key "reload confs")))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-***REMOVED***le-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-***REMOVED***le-coding-system)
    (setq-default buffer-***REMOVED***le-coding-system 'utf-8)
  (setq default-buffer-***REMOVED***le-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string ***REMOVED***rst; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;(mac-auto-operator-composition-mode t)

(setq frame-resize-pixelwise t)

(setq vc-follow-symlinks t)

(setq backup-directory-alist `(("." . "~/.cache/emacs/saves"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(use-package orderless
  :defer 0.1
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((***REMOVED***le (styles . (partial-completion))))))

(defun js/get-project-root ()
  (when-let (project (project-current))
    (car (project-roots project))))

(use-package consult
  :bind (("C-s" . consult-line)
   ("C-M-l" . consult-imenu)
   ("M-p" . consult-yank-from-kill-ring)
   :map minibuffer-local-map
   ("C-r" . consult-history))
  :custom
  (consult-project-root-function #'js/get-project-root)
  (completion-in-region-function #'consult-completion-in-region))

(use-package consult-dir
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map 
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-***REMOVED***le)))

(use-package consult-lsp
  :after (consult lsp-mode)
  :commands consult-lsp-symbols
  :con***REMOVED***g
  (consult-lsp-marginalia-mode))

(use-package company-lsp
  :after (lsp-mode company)
  :con***REMOVED***g
  (push 'company-lsp company-backend))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package yasnippet
  :con***REMOVED***g
  (yas-global-mode t)
  (de***REMOVED***ne-key yas-minor-mode-map (kbd "<tab>") nil)
  (de***REMOVED***ne-key yas-minor-mode-map (kbd "C-'") #'yas-expand)
  (add-to-list #'yas-snippet-dirs "my-personal-snippets")
  (yas-reload-all)
  (setq yas-prompt-functions '(yas-ido-prompt))
  (defun help/yas-after-exit-snippet-hook-fn ()
    (prettify-symbols-mode)
    (prettify-symbols-mode))
  (add-hook 'yas-after-exit-snippet-hook #'help/yas-after-exit-snippet-hook-fn)
  :diminish yas-minor-mode)

(use-package embark
  :bind (("C-S-a" . embark-act)
	 ("C-S-w" . embark-dwim)
	 :map minibuffer-local-map
	 ("C-d" . embark-act))
  :con***REMOVED***g
  ;; Show Embark actions via which-key
  (setq embark-action-indicator
	(lambda (map _target)
	  (which-key--show-keymap "Embark" map nil nil 'no-paging)
	  #'which-key--hide-popup-ignore-command)
	embark-become-indicator embark-action-indicator))

(use-package embark-consult
  :after embark
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(defun js/minibuffer-backward-kill (arg)
  "When minibuffer is completing a ***REMOVED***le name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-***REMOVED***le-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
      (backward-kill-word arg)))

(use-package vertico
  :after orderless
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("H-j" . vertico-next)
         ("H-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . js/minibuffer-backward-kill))
  :custom
  (vertico-cycle t)
  :custom-face
  ;; for doom-one use #3a3f5a 
  (vertico-current ((t (:background "#3c3836"))))
  ;; :con***REMOVED***g
  ;; (de***REMOVED***ne-key vertico-map (kbd "C-k") 'vertico-previous) 
  :init
  (vertico-mode))

(use-package savehist
  :hook (emacs-startup . (lambda () (savehist-mode)))
  ;; :init
  ;; (savehist-mode)
  )

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'consult-read-multiple :***REMOVED***lter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package all-the-icons)

(use-package all-the-icons-completion
  :straight (:host github :repo "iyefrat/all-the-icons-completion")
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup))

(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook (emacs-startup . marginalia-mode))

(use-package corfu
  :after orderless
  :bind
  (:map corfu-map
        ("C-j" . corfu-next)
        ("C-k" . corfu-previous)
        ("H-j" . corfu-next)
        ("H-k" . corfu-previous)
        ("TAB" . corfu-insert))
  :custom
  (corfu-cycle t)
  (corfu-quit-at-boundary t)
  (corfu-quit-no-match t)
  :init
  (corfu-global-mode))

(use-package cape
  ;; Bind dedicated completion commands
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p f" . cape-***REMOVED***le)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p i" . cape-ispell)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p \\" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-***REMOVED***le)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
)

(use-package dabbrev
  :bind
  (("C-SPC" . dabbrev-completion)))

(use-package savehist
  :defer 0.1 
  :con***REMOVED***g
  (savehist-mode))

  ;; Individual history elements can be con***REMOVED***gured separately
  ;;(put 'minibuffer-history 'history-length 25)
  ;;(put 'evil-ex-history 'history-length 50)
  ;;(put 'kill-ring 'history-length 25))

(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

(use-package centered-window)

(use-package olivetti)

;; (use-package sublimity
;;   :con***REMOVED***g
;;   (require 'sublimity-map)
;;   (require 'sublimity-attractive))

(use-package minimap)

(use-package burly
  :straight (:host github :type git :repo "alphapapa/burly.el"))

(use-package magit
  :bind ("C-M-;" . magit-status)
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(js/leader-key-def
  "g"   '(:ignore t :which-key "git")
  "gs"  'magit-status
  "gd"  'magit-diff-unstaged
  "gc"  'magit-branch-or-checkout
  "gl"   '(:ignore t :which-key "log")
  "glc" 'magit-log-current
  "glf" 'magit-log-buffer-***REMOVED***le
  "gb"  'magit-branch
  "gP"  'magit-push-current
  "gp"  'magit-pull-branch
  "gf"  'magit-fetch
  "gF"  'magit-fetch-all
  "gr"  'magit-rebase)

(use-package code-review)

(use-package blamer
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 140
                    :italic t)))
  :con***REMOVED***g
  (global-blamer-mode 1))

(use-package project
  :con***REMOVED***g
  (add-to-list 'project-switch-commands '(magit-status "Magit status" ?m))
  :general
  (js/leader-key-def
    "p"   '(:ignore t :which-key "project")
    "pf"  'project-***REMOVED***nd-***REMOVED***le
    "ps"  'project-switch-project
    "pF"  'consult-ripgrep
    "pp"  'project-***REMOVED***nd-***REMOVED***le
    "pc"  'project-compile
    "pd"  'project-dired
    "pb"  'project-switch-to-buffer))

(use-package treemacs
  :defer 1.5
  :con***REMOVED***g
  (js/leader-key-def
    "t"   '(:ignore t :which-key "treemacs")
    "tt"  'treemacs)
  (setq treemacs-follow-mode t))

(use-package treemacs-evil
  :after treemacs evil)

(use-package treemacs-all-the-icons
  :after treemacs
  :con***REMOVED***g
  (treemacs-load-theme "all-the-icons"))

(use-package vterm)

(use-package prism
  :straight (:host github :type git :repo "alphapapa/prism.el"))

;(use-package cider)

(use-package inf-clojure
  :hook
  (clojure-mode . inf-clojure-minor-mode))

(use-package nvm)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :con***REMOVED***g
  (setq typescript-indent-level 2))

(defun js/set-js-indentation ()
  (setq js-indent-level 2)
  (setq evil-shift-width js-indent-level)
  (setq-default tab-width 2))

(use-package js2-mode
  :mode
  (("\\.js\\'" . js2-mode))
  :custom
  (js2-include-node-externs t)
  (js2-global-externs '("customElements"))
  (js2-highlight-level 3)
  (js2r-prefer-let-over-var t)
  (js2r-prefered-quote-type 2)
  (js-indent-align-list-continuation t)
  (global-auto-highlight-symbol-mode t) 
  :con***REMOVED***g
  ;; Use js2-mode for Node scripts
  (add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))
  ;; Don't use built-in syntax checking
  ; (setq js2-mode-show-strict-warnings nil)

  ;; Set up proper indentation in JavaScript and JSON ***REMOVED***les
  (add-hook 'js2-mode-hook #'js/set-js-indentation)
  (add-hook 'json-mode-hook #'js/set-js-indentation))

(use-package apheleia
  :con***REMOVED***g
  (apheleia-global-mode +1))

;; (use-package prettier-js
;;   :con***REMOVED***g
;;   (setq prettier-js-args '(
;;                            "--single-quote" "true"
;;                            ))

;;   :hook ((js2-mode . prettier-js-mode)
;e          (typescript-mode . prettier-js-mode)))

(use-package js2-refactor
  :hook (js2-mode . js2-refactor-mode))

(use-package xref-js2
  :hook (js2-mode . (lambda ()
                      (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
(add-hook 'js2-mode-hook (lambda ()
                         (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package tide
  :hook ((js2-mode . tide-setup)
         (js2-mode . tide-hl-identi***REMOVED***er-mode)
         (before-save . tide-format-before-save)))

(use-package go-mode)

(use-package gotest)

(use-package lsp-java)

(use-package yaml-mode)

(use-package lsp-mode
  :commands lsp
  :hook
  (((clojure-mode clojurescript-mode clojurec-mode python-mode go-mode terraform-mode java-mode js2-mode) . lsp)
   (go-mode . js/lsp-go-install-save-hooks))
  :bind
  (:map lsp-mode-map ("TAB" . completion-at-point))
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-modeline-code-actions-enable nil)
  (lsp-lens-enable t)
  (lsp-idle-delay 0.500)
  :con***REMOVED***g
  (setq read-process-output-max 1048576) ; (* 1024 1024)

  ;; Install TF LSP: https://github.com/hashicorp/terraform-ls
  ;; Editor integration: https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#emacs
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("/usr/local/bin/terraform-ls" "serve"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls))

  (setq lsp-eslint-format nil
        lsp-eslint-enable nil) 

  ;; gopls
  (defun js/lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)))) 

(js/leader-key-def
  "l"  '(:ignore t :which-key "lsp")
  "ld" 'xref-***REMOVED***nd-de***REMOVED***nitions
  "lr" 'xref-***REMOVED***nd-references
  "ln" 'lsp-ui-***REMOVED***nd-next-reference
  "lp" 'lsp-ui-***REMOVED***nd-prev-reference
  "ls" 'counsel-imenu
  "le" 'lsp-ui-flycheck-list
  "lS" 'lsp-ui-sideline-mode
  "lX" 'lsp-execute-code-action)

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :con***REMOVED***g
  (setq lsp-ui-doc-position 'bottom))

;; (use-package lsp-pyright
  ;;   :after lsp-mode
  ;;   :hook (python-mode . (lambda ()
  ;;                          (require 'lsp-pyright)
  ;;                          (lsp-deferred))))
;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred

(use-package dap-mode
  ;; Uncomment the con***REMOVED***g below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-con***REMOVED***gure nil)
  ;; :con***REMOVED***g
  ;; (dap-ui-mode 1)
  :commands dap-debug
  :con***REMOVED***g
  ;; Set up Node debugging
  (require 'dap-node)
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed
  (require 'dap-go)
  ;; Bind `C-c l d` to `dap-hydra` for easy access
  (general-de***REMOVED***ne-key
    :keymaps 'lsp-mode-map
    :pre***REMOVED***x lsp-keymap-pre***REMOVED***x
    "d" '(dap-hydra t :wk "debugger")))

(use-package lsp-treemacs
  :after (lsp treemacs)
  :init
  (lsp-treemacs-sync-mode 1))

(use-package docker
  :ensure t
  :general
  (js/leader-key-def
    "c" 'docker))

(use-package terraform-mode)

(use-package eglot)

(use-package platformio-mode
  :hook
  (c++-mode-hook . (lambda ()
                     (lsp-deferred)
                     (platformio-conditionally-enable))))

(use-package aggressive-indent-mode
  :hook (emacs-lisp-mode-hook clojure-mode org))

(use-package company
  :hook (emacs-startup . global-company-mode)
  :bind ("H-SPC" . company-complete)
  :con***REMOVED***g
  (setq company-idle-delay 0.2))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook (org-mode
         emacs-lisp-mode
         web-mode
         typescript-mode
         js2-mode))

(use-package flycheck
  :hook (lsp-mode . flycheck-mode))

(use-package avy
  :bind
  (("M-g c" . 'avy-goto-char)
   ("M-g 2" . 'avy-goto-char-2)
   ("M-g t" . 'avy-goto-char-timer)
   ("H-s"   . 'avy-goto-char-timer)
   ("M-g h" . 'avy-org-goto-heading-timer)
   ("M-g l" . 'avy-goto-line))
  :general
  (js/leader-key-def
    "j"   '(:ignore t :which-key "jump")
    "jt"  '(avy-goto-char-timer :which-key "timer"))
  :con***REMOVED***g
  (avy-setup-default))

(use-package ace-window
  :bind
  (("M-o" . ace-window))
  :custom
  (aw-scope 'global)
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (aw-minibuffer-flag t)
  (aw-background nil)
  :con***REMOVED***g
  (ace-window-display-mode 1))

(use-package transpose-frame)

(use-package expand-region
   :bind (("M-[" . er/expand-region)
          ("C-(" . er/mark-outside-pairs)))

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package winner
  :after evil
  :con***REMOVED***g
  (winner-mode)
  (de***REMOVED***ne-key evil-window-map "u" 'winner-undo)
  (de***REMOVED***ne-key evil-window-map "U" 'winner-redo))

(use-package super-save
  :defer 1
  :diminish super-save-mode
  :con***REMOVED***g
  (super-save-mode +1)
  :custom
  (super-save-auto-save-when-idle t))

(use-package diff-hl
  :con***REMOVED***g
  (global-diff-hl-mode)
  :hook
  (magit-pre-refresh-hook . diff-hl-magit-pre-refresh)
  (magit-post-refresh-hook . diff-hl-magit-post-refresh))

(use-package alert
  :commands alert
  :con***REMOVED***g
  (setq alert-default-style 'noti***REMOVED***cations))

(use-package bufler
 :con***REMOVED***g
 (bufler-mode))

(use-package emacs-everywhere)

(use-package ag)

(use-package dogears
  :straight (:host github :type git :repo "alphapapa/dogears.el")
  :defer 3
  :con***REMOVED***g
  (dogears-mode)
  :general
  (js/leader-key-def
    "d"   '(:ignore t :which-key "dogears")
    "dg"  '(dogears-go :which-key "go")
    "db"  '(dogears-back :which-key "back")
    "df"  '(dogears-forward :which-key "forward")
    "dl"  '(dogears-list :which-key "list")
    "ds"  '(dogears-sidebar :which-key "sidebar")))

(use-package pomm
  :con***REMOVED***g
  (setq pomm-audio-enabled t)
  :commands (pomm))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)) 

(defun js/dired-con***REMOVED***g ()
  (dired-omit-mode 1)
  (dired-hide-details-mode 1)
  (hl-line-mode 1))

(use-package dired
  :after evil-collection
  :straight (:type built-in)
  :commands (dired dired-jump)
  :hook (dired-mode . js/dired-con***REMOVED***g)
  :con***REMOVED***g
  (setq dired-omit-verbose nil
        dired-hide-details-hide-symlink-targets nil
        delete-by-moving-to-trash t))

(use-package dired-rainbow
  :defer 2
  :con***REMOVED***g
  (dired-rainbow-de***REMOVED***ne-chmod directory "#6cb2eb" "d.*")
  (dired-rainbow-de***REMOVED***ne html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
  (dired-rainbow-de***REMOVED***ne xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
  (dired-rainbow-de***REMOVED***ne document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
  (dired-rainbow-de***REMOVED***ne markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "text***REMOVED***le" "txt"))
  (dired-rainbow-de***REMOVED***ne database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
  (dired-rainbow-de***REMOVED***ne media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
  (dired-rainbow-de***REMOVED***ne image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
  (dired-rainbow-de***REMOVED***ne log "#c17d11" ("log"))
  (dired-rainbow-de***REMOVED***ne shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
  (dired-rainbow-de***REMOVED***ne interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
  (dired-rainbow-de***REMOVED***ne compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
  (dired-rainbow-de***REMOVED***ne executable "#8cc4ff" ("exe" "msi"))
  (dired-rainbow-de***REMOVED***ne compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
  (dired-rainbow-de***REMOVED***ne packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
  (dired-rainbow-de***REMOVED***ne encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
  (dired-rainbow-de***REMOVED***ne fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
  (dired-rainbow-de***REMOVED***ne partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
  (dired-rainbow-de***REMOVED***ne vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
  (dired-rainbow-de***REMOVED***ne-chmod executable-unix "#38c172" "-.*x.*")) 

(use-package diredfl
  :hook (dired-mode . diredfl-mode)
  :con***REMOVED***g
  (diredfl-global-mode 1)) 

(use-package dired-single)
(use-package dired-ranger)
(use-package dired-collapse)

;; Turn on indentation and auto-***REMOVED***ll mode for Org ***REMOVED***les
(defun js/org-mode-setup ()
  (org-indent-mode)
  ;; (variable-pitch-mode 1) ;; Causes table columns to be unaligned
  (auto-***REMOVED***ll-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (diminish org-indent-mode))

(use-package org 
  :preface
  (setq org-modules
        '(;; ol-w3m
          ;; ol-bbdb
          ol-bibtex
          ;; org-tempo
          ;; org-crypt
          ;; org-habit
          ;; org-bookmark
          ;; org-eshell
          ;; org-irc
          org-indent
          ;; ol-docview
          ;; ol-gnus
          ;; ol-info
          ;; ol-irc
          ;; ol-mhe
          ;; ol-rmail
          ;; ol-eww
          ))
  :hook (org-mode . js/org-mode-setup)
  :general
  (js/leader-key-def
    "o"   '(:ignore t :which-key "org")
    "ot"  '(org-babel-tangle :which-key "tangle")
    "oe"  '(org-ctrl-c-ctrl-c :which-key "eval"))
  :con***REMOVED***g
  (evil-de***REMOVED***ne-key '(normal insert visual) org-mode-map (kbd "H-j") 'org-next-visible-heading)
  (evil-de***REMOVED***ne-key '(normal insert visual) org-mode-map (kbd "H-k") 'org-previous-visible-heading)
  :custom
  (org-ellipsis " ▾")
  (org-hide-emphasis-markers t)
  (org-src-fontify-natively t)
  (org-fontify-quote-and-verse-blocks t)
  (org-src-tab-acts-natively t)
  (org-edit-src-content-indentation 2)
  (org-hide-block-startup nil)
  (org-src-preserve-indentation nil)
  (org-startup-folded 'content)
  (org-cycle-separator-lines 2)
  (org-structure-template-alist '(("a" . "export ascii")
                                  ("c" . "center")
                                  ("C" . "comment")
                                  ("e" . "example")
                                  ("E" . "export")
                                  ("h" . "export html")
                                  ("l" . "export latex")
                                  ("q" . "quote")
                                  ("s" . "src")
                                  ("v" . "verse")
                                  ("el" . "src emacs-lisp")
                                  ("py" . "src python")
                                  ("json" . "src json")
                                  ("yaml" . "src yaml")
                                  ("sh" . "src sh")
                                  ("go" . "src go")
                                  ("clj" . "src clojure")))
  :custom-face
  (org-document-title ((t (:weight bold :height 1.3))))
  (org-level-1 ((t (:inherit 'outline-1 :weight medium :height 1.2))))
  (org-level-2 ((t (:inherit 'outline-2 :weight medium :height 1.1))))
  (org-level-3 ((t (:inherit 'outline-3 :weight medium :height 1.05))))
  (org-level-4 ((t (:inherit 'outline-4 :weight medium :height 1.0))))
  (org-level-5 ((t (:inherit 'outline-5 :weight medium :height 1.1))))
  (org-level-6 ((t (:inherit 'outline-6 :weight medium :height 1.1))))
  (org-level-7 ((t (:inherit 'outline-7 :weight medium :height 1.1))))
  (org-level-8 ((t (:inherit 'outline-8 :weight medium :height 1.1)))))

(use-package org-pomodoro
  ;:after org-mode
  :general
  (js/leader-key-def
    "op"  '(org-pomodoro :which-key "pomodoro")))

(use-package org-make-toc
  :hook (org-mode . org-make-toc-mode))

(defun js/org-mode-visual-***REMOVED***ll ()
  (setq visual-***REMOVED***ll-column-width 110
        visual-***REMOVED***ll-column-center-text t)
(visual-***REMOVED***ll-column-mode 1))

(use-package visual-***REMOVED***ll-column
  :hook (org-mode . js/org-mode-visual-***REMOVED***ll))

;; Increase the size of various headings
;(set-face-attribute 'org-document-title nil :font "JetBrains Mono" :weight 'bold :height 1.3)
;(dolist (face '((org-level-1 . 1.2)
;                (org-level-2 . 1.1)
;(org-level-3 . 1.05)
;                (org-level-4 . 1.0)
;                (org-level-5 . 1.1)
;                (org-level-6 . 1.1)
;                (org-level-7 . 1.1)
;                (org-level-8 . 1.1)))
;(set-face-attribute (car face) nil :font "JetBrains Mono" :weight 'medium :height (cdr face)))

;; Make sure org-indent face is available
;(require 'org-indent)

;; Ensure that anything that should be ***REMOVED***xed-pitch in Org ***REMOVED***les appears that way
;(set-face-attribute 'org-block nil :foreground nil :inherit '***REMOVED***xed-pitch)
;(set-face-attribute 'org-table nil  :inherit '***REMOVED***xed-pitch)
;(set-face-attribute 'org-formula nil  :inherit '***REMOVED***xed-pitch)
;(set-face-attribute 'org-code nil   :inherit '(shadow ***REMOVED***xed-pitch))
;(set-face-attribute 'org-indent nil :inherit '(org-hide ***REMOVED***xed-pitch))
;(set-face-attribute 'org-verbatim nil :inherit '(shadow ***REMOVED***xed-pitch))
;(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face ***REMOVED***xed-pitch))
;(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face ***REMOVED***xed-pitch))
;(set-face-attribute 'org-checkbox nil :inherit '***REMOVED***xed-pitch)

;; Get rid of the background on column views
;;(set-face-attribute 'org-column nil :background nil)
;;(set-face-attribute 'org-column-title nil :background nil)

(use-package org-roam
  :custom
  (org-roam-directory (***REMOVED***le-truename "/Volumes/GoogleDrive/My Drive/Org/org-roam"))
  :general
  (js/leader-key-def
    "or"    '(:ignore t :which-key "org-roam")
    "orb"   '(org-roam-buffer-toggle :which-key "toggle-buffer")
    "orf"   '(org-roam-node-***REMOVED***nd :which-key "***REMOVED***nd-node")
    "org"   '(org-roam-graph :which-key "graph")
    "ori"   '(org-roam-node-insert :which-key "insert-node")
    "orc"   '(org-roam-capture :which-key "capture")
    "ort"  '(org-roam-dailies-capture-today :which-key "capture-today"))
  :con***REMOVED***g
  (setq org-roam-v2-ack t)
  (org-roam-setup))

(use-package org-brain
  :init
  (setq org-brain-path "/Volumes/GoogleDrive/My Drive/Org/org-brain")
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  :con***REMOVED***g
  (bind-key "C-c b" 'org-brain-pre***REMOVED***x-map org-mode-map)
  (setq org-id-track-globally t)
  (setq org-id-locations-***REMOVED***le "~/.emacs.d/.org-id-locations")
  (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-***REMOVED***le-entries nil
        org-brain-***REMOVED***le-entries-use-title nil))

(use-package polymode
  :con***REMOVED***g
  (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode))

(use-package markdown-mode
  :mode
  ("README\\.md\\'" . gfm-mode)
  :custom
  (markdown-command "marked")
  (markdown-max-image-size '(850 . 900)))

(use-package transmission)

(use-package plantuml-mode
  :con***REMOVED***g
  (setq plantuml-executable-path "/usr/local/bin/plantuml")
  (setq plantuml-default-exec-mode 'executable))

(use-package speed-type)

(use-package bug-hunter)
