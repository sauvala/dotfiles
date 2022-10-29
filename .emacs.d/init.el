;;; init.el -*- lexical-binding: t ; eval: (view-mode -1) -*-

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
  :con***REMOVED***g (cond ((daemonp) (exec-path-from-shell-initialize))
                ((memq window-system '(mac ns x)) (exec-path-from-shell-initialize))))

(setq mac-right-option-modi***REMOVED***er 'nil
      mac-option-modi***REMOVED***er 'super
      mac-command-modi***REMOVED***er 'meta
      ns-function-modi***REMOVED***er 'hyper
      x-select-enable-clipboard t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package which-key
  ;; :init 
  :diminish which-key-mode
  :hook (after-init . which-key-mode)
  :con***REMOVED***g
  (setq which-key-idle-delay 0.3))

(use-package general
  :defer 0.1
  :con***REMOVED***g
  (general-create-de***REMOVED***ner js/leader-key-def
    :pre***REMOVED***x "C-c"
    :global-pre***REMOVED***x "H-SPC"))

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
      "bl"  '(consult-buffer :which-key "list buffers")
      "Pa"  '(pro***REMOVED***ler-start :which-key "pro***REMOVED***ler start")
      "Pe"  '(pro***REMOVED***ler-stop :which-key "pro***REMOVED***ler stop")
      "Pr"  '(pro***REMOVED***ler-report :which-key "pro***REMOVED***ler report"))

(pixel-scroll-precision-mode)

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
  :con***REMOVED***g
  ;; Add all your customizations prior to loading the themes
  ;;   (setq modus-themes-italic-constructs t
  ;;         modus-themes-bold-constructs nil
  ;;         modus-themes-region '(bg-only no-extend))
  (setq
        ; modus-themes-italic-constructs nil
        modus-themes-bold-constructs t
        ; modus-themes-mixed-fonts nil
        modus-themes-subtle-line-numbers t
        ; modus-themes-intense-mouseovers t
        ;; modus-themes-deuteranopia t
        modus-themes-tabs-accented nil
        ;; modus-themes-variable-pitch-ui nil
        modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related
        modus-themes-fringes nil ; {nil,'subtle,'intense}

        ;; Options for `modus-themes-lang-checkers' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `straight-underline', `text-also', `background',
        ;; `intense' OR `faint'.
        modus-themes-lang-checkers '(straight-underline)

        ;; Options for `modus-themes-mode-line' are either nil, or a list
        ;; that can combine any of `3d' OR `moody', `borderless',
        ;; `accented', a natural number for extra padding (or a cons cell
        ;; of padding and NATNUM), and a floating point for the height of
        ;; the text relative to the base font size (or a cons cell of
        ;; height and FLOAT)
        modus-themes-mode-line '(borderless)

        ;; Options for `modus-themes-markup' are either nil, or a list
        ;; that can combine any of `bold', `italic', `background',
        ;; `intense'.
        ;; modus-themes-markup nil

        ;; Options for `modus-themes-syntax' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `faint', `yellow-comments', `green-strings', `alt-syntax'
        modus-themes-syntax '(faint)

        ;; Options for `modus-themes-hl-line' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `accented', `underline', `intense'
        modus-themes-hl-line '(intense)

        ;; Options for `modus-themes-paren-match' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `bold', `intense', `underline'
        modus-themes-paren-match '(bold intense)

        ;; Options for `modus-themes-links' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
        ;; `bold', `italic', `background'
        modus-themes-links '(neutral-underline)

        ;; Options for `modus-themes-box-buttons' are either nil (the
        ;; default), or a list that can combine any of `flat',
        ;; `accented', `faint', `variable-pitch', `underline', the
        ;; symbol of any font weight as listed in
        ;; `modus-themes-weights', and a floating point number
        ;; (e.g. 0.9) for the height of the button's text.
        ;; modus-themes-box-buttons '(variable-pitch flat faint 0.9)

        ;; Options for `modus-themes-prompts' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `background', `bold', `gray', `intense', `italic'
        modus-themes-prompts '(intense)

        ;; The `modus-themes-completions' is an alist that reads three
        ;; keys: `matches', `selection', `popup'.  Each accepts a nil
        ;; value (or empty list) or a list of properties that can include
        ;; any of the following (for WEIGHT read further below):
        ;;
        ;; `matches' - `background', `intense', `underline', `italic', WEIGHT
        ;; `selection' - `accented', `intense', `underline', `italic', `text-also', WEIGHT
        ;; `popup' - same as `selected'
        ;; `t' - applies to any key not explicitly referenced (check docs)
        ;;
        ;; WEIGHT is a symbol such as `semibold', `light', or anything
        ;; covered in `modus-themes-weights'.  Bold is used in the absence
        ;; of an explicit WEIGHT.
         ;; modus-themes-completions
         ;; '((matches . (extrabold background))
         ;;   (selection . (intense accented))
         ;;   (popup . (accented intense)))

        ;; modus-themes-mail-citations nil ; {nil,'intense,'faint,'monochrome}

        ;; Options for `modus-themes-region' are either nil (the default),
        ;; or a list of properties that may include any of those symbols:
        ;; `no-extend', `bg-only', `accented'
        modus-themes-region '(bb-only accented)

        ;; Options for `modus-themes-diffs': nil, 'desaturated, 'bg-only
        ;; modus-themes-diffs 'desaturated

        modus-themes-org-blocks nil ; {nil,'gray-background,'tinted-background}

        ;; modus-themes-org-agenda ; this is an alist: read the manual or its doc string
        ;; '((header-block . (variable-pitch regular 1.4))
        ;;   (header-date . (bold-today grayscale underline-today 1.2))
        ;;   (event . (accented italic varied))
        ;;   (scheduled . uniform)
        ;;   (habit . nil))

        ;;modus-themes-headings ; this is an alist: read the manual or its doc string
        ;;'((t . (variable-pitch extrabold)))

        ;; (let ((time (string-to-number (format-time-string "%H"))))
        ;;   (if (and (> time 5) (< time 18))
        ;;       (modus-themes-load-operandi)
        ;;     (modus-themes-load-vivendi)))

        ;; Sample for headings:

        ;; modus-themes-headings
        ;; '((1 . (variable-pitch light 1.6))
        ;;   (2 . (variable-pitch regular 1.4))
        ;;   (3 . (variable-pitch regular 1.3))
        ;;   (4 . (1.2))
        ;;   (5 . (1.1))
        ;;   (t . (monochrome 1.05)))
        )

  ;; Load the theme ***REMOVED***les before enabling a theme
  ;; (modus-themes-load-themes)
  ;; (modus-themes-load-vivendi) ;; OR (modus-themes-load-vivendi)
  ;; :con***REMOVED***g
  ;; Load the theme of your choice:
  )

(use-package ef-themes
  :hook (emacs-startup . (lambda ()
                           (progn
                             (mapc #'disable-theme custom-enabled-themes)
                             (ef-themes-select 'ef-autumn))))
  :straight (:host github :repo "protesilaos/ef-themes"))

(defun js/change-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (modus-themes-load-operandi))
    ('dark (modus-themes-load-vivendi))))

(add-hook 'ns-system-appearance-change-functions #'js/change-theme)

(use-package doom-themes
	;; :hook (emacs-startup . (lambda () (load-theme 'doom-one t)))
	:con***REMOVED***g
	;; make fringe match the bg
	(custom-set-faces
	 `(fringe ((t (:background nil)))))

	;; Global settings (defaults)
	(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
				doom-themes-enable-italic t) ; if nil, italics is universally disabled

	;; Enable flashing mode-line on errors
	(doom-themes-visual-bell-con***REMOVED***g)
	;; or for treemacs users
	(setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
	(doom-themes-treemacs-con***REMOVED***g)
	;; Corrects (and improves) org-mode's native fonti***REMOVED***cation.
	(doom-themes-org-con***REMOVED***g))

(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))

(use-package solaire-mode
  :con***REMOVED***g
  (solaire-global-mode +1))

(setq fancy-splash-image (concat default-directory ".emacs.d/img/emacs-e-1-smaller.svg"))

(use-package emojify
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)

(use-package mood-line
  :hook (after-init . mood-line-mode))

;; (defun js/doom-modeline--font-height ()
;;   "Calculate the actual char height of the mode-line."
;;   (+ (frame-char-height) 2))

;; (advice-add #'doom-modeline--font-height :override #'js/doom-modeline--font-height)

(use-package minions
  :con***REMOVED***g
  (minions-mode 1)
  ;; :after doom-modeline
  ;; :hook (doom-modeline-mode . minions-mode)
  )

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

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(setq frame-resize-pixelwise t)

(setq vc-follow-symlinks t)

(setq backup-directory-alist `(("." . "~/.cache/emacs/saves"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq large-***REMOVED***le-warning-threshold 100000000)

(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))

(setq kill-do-not-save-duplicates t)

(require 'tramp)
(setq tramp-default-method "ssh")

(defun my/vc-off-if-remote ()
  (if (***REMOVED***le-remote-p (buffer-***REMOVED***le-name))
      (setq-local vc-handled-backends nil)))
(add-hook '***REMOVED***nd-***REMOVED***le-hook 'my/vc-off-if-remote)

(setq vc-handled-backends '(Git))

(use-package consult-tramp
  :straight (:host github :repo "Ladicle/consult-tramp"))

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

(use-package yasnippet-snippets
  :after (yasnippet))

(use-package yasnippet
  :con***REMOVED***g
  (yas-global-mode t)
  (de***REMOVED***ne-key yas-minor-mode-map (kbd "<tab>") nil)
  (de***REMOVED***ne-key yas-minor-mode-map (kbd "C-'") #'yas-expand)
  ;; (add-to-list #'yas-snippet-dirs "~/.emacs.d/my-yas-snippets")
  (yas-reload-all)
  (setq yas-prompt-functions '(yas-ido-prompt))
  (defun help/yas-after-exit-snippet-hook-fn ()
    (prettify-symbols-mode)
    (prettify-symbols-mode))
  (add-hook 'yas-after-exit-snippet-hook #'help/yas-after-exit-snippet-hook-fn)
  :diminish yas-minor-mode)

(use-package tempel
  ;; Require trigger pre***REMOVED***x before template name when completing.
  ;; :custom
  ;; (tempel-trigger-pre***REMOVED***x "<")

  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :init

  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also con***REMOVED***gure `tempel-trigger-pre***REMOVED***x', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried ***REMOVED***rst.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  (global-tempel-abbrev-mode)
  )

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
  :after (embark)
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
  (vertico-cycle nil)
  ;; :custom-face
  ;; for doom-one use #3a3f5a
  ;; (vertico-current ((t (:background "#3c3836"))))
  ;; :con***REMOVED***g
  ;; (de***REMOVED***ne-key vertico-map (kbd "C-k") 'vertico-previous)
  :init
  (vertico-mode))

(use-package savehist
  :hook (emacs-startup . (lambda () (savehist-mode))))

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
  :straight (:host github :repo "MintSoup/all-the-icons-completion")
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup))

(use-package marginalia
  :after (vertico)
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook (emacs-startup . marginalia-mode)
  :init (marginalia-mode))

(use-package corfu
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))
  :bind
  (:map corfu-map
        ("C-j" . corfu-next)
        ("C-k" . corfu-previous)
        ("H-j" . corfu-next)
        ("H-k" . corfu-previous)
        ("TAB" . corfu-insert))
  :custom
  (corfu-auto t)
  (corfu-cycle nil)
  (corfu-separator ?\s)
  (corfu-quit-at-boundary 'separator)
  (corfu-quit-no-match 'separator)
  (corfu-on-exact-match 'insert)
  (corfu-preview-current 'insert)
  (corfu-echo-documentation '(1.0 . 0.2))
  (corfu-preselect-***REMOVED***rst t)
  :init
  (global-corfu-mode))

(use-package corfu-doc
  :after (corfu)
  :con***REMOVED***g
  (corfu-doc-mode))

(use-package svg-lib)

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  ;; (kind-icon-blend-frac 0.08)
  ;; (svg-lib-icons-dir (no-littering-expand-var-***REMOVED***le-name "svg-lib/cache/")) ; Change cache dir
  :con***REMOVED***g
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

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
  ;; :bind
  ;; (("C-SPC" . dabbrev-completion))
  )

(use-package savehist
  :defer 0.1 
  :con***REMOVED***g
  (savehist-mode))

(if (and (eq system-type 'gnu/linux)
         (executable-***REMOVED***nd "powershell.exe"))
    (progn
      (defun js/wsl-copy (start end)
        (interactive "r")
        (shell-command-on-region start end "clip.exe")
        (deactivate-mark))
      (global-set-key
       (kbd "C-c W")
       'js/wsl-copy)))

(defvar js/default-font-size 150)
(defvar js/default-variable-font-size 150)

(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :weight 'normal
                    :height js/default-font-size)

;; Set the ***REMOVED***xed pitch face
(set-face-attribute '***REMOVED***xed-pitch nil
                    :font "JetBrains Mono"
                    :weight 'light
                    :height js/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil
                    :font "JetBrains Mono"
                    :weight 'light
                    :height js/default-variable-font-size)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq-default bidi-paragraph-direction 'left-to-right)

(if (version<= "27.1" emacs-version)
  (setq bidi-inhibit-bpa t))

(if (version<= "27.1" emacs-version)
  (global-so-long-mode 1))

(use-package highlight-indent-guides
  :con***REMOVED***g
  (setq highlight-indent-guides-method 'bitmap))

(use-package highlight-indentation-mode
  :straight (:host github :type git :repo "antonj/Highlight-Indentation-for-Emacs"))

(use-package centered-window)

(use-package olivetti)

(use-package perfect-margin)

(use-package sublimity
	:con***REMOVED***g
	(sublimity-mode 1))

(use-package minimap)

(use-package demap
  :straight (:host gitlab :type git :repo "sawyerjgardner/demap.el")
  :con***REMOVED***g
  (setq demap-minimap-window-side 'right))

(use-package burly
  :straight (:host github :type git :repo "alphapapa/burly.el"))

(setq global-auto-revert-non-***REMOVED***le-buffers t)
(global-auto-revert-mode 1)

(use-package ws-butler
  :hook
  ((text-mode prog-mode org-mode) . ws-butler-mode))

(electric-pair-mode 1)
(show-paren-mode 1)

(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

(use-package lin)

(use-package logos)

(use-package pulsar
  :straight (:host gitlab :type git :repo "protesilaos/pulsar")
  :con***REMOVED***g
  (customize-set-variable
   'pulsar-pulse-functions ; Read the doc string for why not `setq'
   '(recenter-top-bottom
     move-to-window-line-top-bottom
     reposition-window
     bookmark-jump
     other-window
     delete-window
     delete-other-windows
     forward-page
     backward-page
     scroll-up-command
     scroll-down-command
     windmove-right
     windmove-left
     windmove-up
     windmove-down
     windmove-swap-states-right
     windmove-swap-states-left
     windmove-swap-states-up
     windmove-swap-states-down
     tab-new
     tab-close
     tab-next
     org-next-visible-heading
     org-previous-visible-heading
     org-forward-heading-same-level
     org-backward-heading-same-level
     outline-backward-same-level
     outline-forward-same-level
     outline-next-visible-heading
     outline-previous-visible-heading
     outline-up-heading))

  (setq pulsar-pulse t)
  (setq pulsar-delay 0.055)
  (setq pulsar-iterations 10)
  (setq pulsar-face 'pulsar-magenta)
  (setq pulsar-highlight-face 'pulsar-yellow))

(use-package undo-hl
  :straight (:host github :type git :repo "casouri/undo-hl")
  :con***REMOVED***g (undo-hl-mode))

(use-package ligature
  :straight (:host github :type git :repo "mickeynp/ligature.el")
  :con***REMOVED***g
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                   ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                   "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                   "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                   "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                   "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                   "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                   "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                   ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                   "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                   "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                   "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                   "\\\\" "://"))
  (global-ligature-mode t))

(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

(when (< 26 emacs-major-version)
 (tab-bar-mode 1)                           ;; enable tab bar
 (setq tab-bar-show 1)                      ;; hide bar if less than 1 tabs open
 (setq tab-bar-close-button-show nil)       ;; hide tab close / X button
 (setq tab-bar-new-tab-choice "*new*");; buffer to show in new tabs
 (setq tab-bar-tab-hints t)                 ;; show tab numbers
 (setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator)))
                                            ;; elements to include in bar

(use-package undo-tree
  :con***REMOVED***g
  (setq undo-tree-auto-save-history t
        undo-limit 800000
        undo-strong-limit 12000000
        undo-outer-limit 120000000)
  :custom
  (undo-tree-history-directory-alist `(("." . "~/.cache/emacs/undo-tree-hist/")))
  :init
  (global-undo-tree-mode 1))

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

(use-package forge
  :after (magit))

(use-package code-review)

(use-package blamer
  :custom
  (blamer-idle-time 0.8)
  (blamer-min-offset 20)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 1)))
  :con***REMOVED***g
  (global-blamer-mode 1))

(use-package why-this)

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
  (progn
    (js/leader-key-def
      "t"   '(:ignore t :which-key "treemacs")
      "tt"  'treemacs)
    (setq treemacs-follow-mode t)))

(use-package treemacs-all-the-icons
  ;; :after (treemacs)
  :init
  (load-***REMOVED***le "~/.emacs.d/straight/repos/treemacs/src/extra/treemacs-all-the-icons.el")
  :con***REMOVED***g
  (treemacs-load-theme "all-the-icons"))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-tab-bar
  :after treemacs
  :con***REMOVED***g
  (treemacs-set-scope-type 'Tabs))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package sr-speedbar)

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

 (use-package prettier-js
   :con***REMOVED***g
   (setq prettier-js-args '("--single-quote" "true"))
   :hook ((js2-mode . prettier-js-mode)
          (typescript-mode . prettier-js-mode)))

(use-package js2-refactor
  :hook (js2-mode . js2-refactor-mode))

(use-package xref-js2
  :hook (js2-mode . (lambda ()
                      (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  :con***REMOVED***g
  (setq xref-js2-search-program 'rg))

(add-hook 'js2-mode-hook (lambda ()
                         (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package go-mode)

(use-package gotest)

(use-package yaml-mode)

(use-package eglot
  :con***REMOVED***g
  (js/leader-key-def
    "l"  '(:ignore t :which-key "lsp")
    "ld" 'xref-***REMOVED***nd-de***REMOVED***nitions
    "lr" 'xref-***REMOVED***nd-references
    "ln" 'xref-next-line
    "lp" 'xref-prev-line
    "ls" 'counsel-imenu
    "lX" 'eglot-code-actions)
  (setq eglot-connect-timeout 10)
  (setq eglot-workspace-con***REMOVED***guration
        '((:gopls . (:usePlaceholders t))
          (:jdtsl . (:usePlaceholders t)))))

(use-package docker
  :ensure t
  :general
  (js/leader-key-def
    "c" 'docker))

(use-package terraform-mode)

(use-package groovy-mode)

(use-package csv-mode)

(use-package rustic
  :con***REMOVED***g
  (setq rustic-lsp-client 'eglot))

(use-package aggressive-indent-mode
  :hook (emacs-lisp-mode-hook clojure-mode org))

(use-package tree-sitter)

(use-package tree-sitter-langs)

(use-package lsp-docker
  :con***REMOVED***g
  (defvar lsp-docker-client-packages
    '(lsp-clients lsp-go lsp-typescript))
  (setq lsp-docker-client-con***REMOVED***gs
        '((:server-id gopls :docker-server-id gopls-docker :server-command "gopls")
          ;; (:server-id ts-ls :docker-server-id tsls-docker :server-command "typescript-language-server --stdio")
          ))
  (lsp-docker-init-clients
   :path-mappings '(("~/Dev/comet" . "/projects"))
   :client-packages lsp-docker-client-packages
   :client-con***REMOVED***gs lsp-docker-client-con***REMOVED***gs))

(use-package inspector)

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

(use-package winner
  :con***REMOVED***g
  (winner-mode))

(use-package super-save
  :defer 1
  :diminish super-save-mode
  :con***REMOVED***g
  (super-save-mode +1)
  (setq super-save-exclude '(".go"))
  (setq auto-save-default nil)
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

(use-package denote)

(use-package detached
  :init
  (detached-init)
  :bind (;; Replace `async-shell-command' with `detached-shell-command'
         ([remap async-shell-command] . detached-shell-command)
         ;; Replace `compile' with `detached-compile'
         ([remap compile] . detached-compile)
         ([remap recompile] . detached-compile-recompile)
         ;; Replace built in completion of sessions with `consult'
         ([remap detached-open-session] . detached-consult-session))
  :custom ((detached-show-output-on-attach t)
           (detached-terminal-data-command system-type)))

(use-package pdf-tools
  :con***REMOVED***g
  (setq pdf-view-use-scaling t))

(use-package mini-frame)

(use-package mini-popup)

(use-package vertico-posframe)

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))

(defun js/dired-con***REMOVED***g ()
  (dired-omit-mode 1)
  (dired-hide-details-mode 1)
  (hl-line-mode 1))

(use-package dired
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

(use-package dirvish)

;; Turn on indentation and auto-***REMOVED***ll mode for Org ***REMOVED***les
(defun js/org-mode-setup ()
	(org-indent-mode)
	;; (variable-pitch-mode 1) ;; Causes table columns to be unaligned
	(auto-***REMOVED***ll-mode 0)
	(visual-line-mode 1)
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
		"oe"  '(org-ctrl-c-ctrl-c :which-key "eval")
		"oc"  '(org-insert-structure-template :which-key "code template"))
	:custom
	;; (org-ellipsis " ▾")
	;; (org-hide-emphasis-markers t)
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
	 (org-level-8 ((t (:inherit 'outline-8 :weight medium :height 1.1))))
	)

(use-package org-modern
  :hook ((org-mode . org-modern-mode)
         (org-agenda-***REMOVED***nalize . org-modern-agenda))
  :con***REMOVED***g
  (progn
    (setq org-modern-variable-pitch nil
          org-modern-label-border 1)
    (set-face-attribute 'org-modern-label nil
                        :box `( :line-width (-1 . ,org-modern-label-border)
                                :color ,(face-background 'default)))))

(use-package valign)

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
  ;;:hook (org-mode . js/org-mode-visual-***REMOVED***ll)
  )

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

(use-package grip-mode)

(use-package markdown-toc)

(use-package transmission)

(use-package plantuml-mode
  :con***REMOVED***g
  (setq plantuml-executable-path "/usr/local/bin/plantuml")
  (setq plantuml-default-exec-mode 'executable))

(use-package circe)

(use-package speed-type)

(use-package bug-hunter)

(use-package elfeed
	:con***REMOVED***g
	(setq elfeed-feeds
				'("https://www.reddit.com/r/emacs/.rss"
					"https://hnrss.org/newest?points=100")))

(use-package elfeed-tube
	:straight (:host github :repo "karthink/elfeed-tube")
	:after elfeed
	:con***REMOVED***g
	;; (setq elfeed-tube-auto-save-p nil) ;; t is auto-save (not default)
	;; (setq elfeed-tube-auto-fetch-p t) ;;  t is auto-fetch (default)
	(elfeed-tube-setup)

	(elfeed-tube-add-feeds '("system crafters"))

	:bind (:map elfeed-show-mode-map
				 ("F" . elfeed-tube-fetch)
				 ([remap save-buffer] . elfeed-tube-save)
				 :map elfeed-search-mode-map
				 ("F" . elfeed-tube-fetch)
				 ([remap save-buffer] . elfeed-tube-save)
				 ("C-c C-f" . elfeed-tube-mpv-follow-mode)
				 ("C-c C-w" . elfeed-tube-mpv-where)))
