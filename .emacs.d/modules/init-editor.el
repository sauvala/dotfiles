 ;;;; init-editor.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Set tab behaviour
(customize-set-variable 'tab-width 2)
(customize-set-variable 'indent-tabs-mode nil)

;; Smooth scrolling
(pixel-scroll-precision-mode)

;; Truncate lines by default
(set-default 'truncate-lines t)

;; Hide truncated lines indicatr
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))

;; Hide line continuation indication
(setq-default fringe-indicator-alist (assq-delete-all 'continuation fringe-indicator-alist))

;; Line numbers
(column-number-mode)

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(desktop-save-mode)
(setq desktop-path '("~/.cache/emacs/desktop/"))
(desktop-read)

(use-package sudo-edit
  :commands sudo-edit)

;; Very large files
(use-package vlf
  :commands vlf)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package paragraphs
  :ensure nil
  :bind
  (("M-{" . forward-paragraph)
   ("M-}" . backward-paragraph)))

;; Undoing window configuration changes
(use-package winner
  :hook emacs-startup)

;; Window movement
(use-package windmove
  :defer 1.5
  :config
  (windmove-default-keybindings 'control))

(use-package window
  :ensure nil
  :defer 1.5
  :bind ("M-o" . other-window))

(use-package avy
  :defer 1.5
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)))

;; Indentation guides
(use-package highlight-indent-guides
  :delight highlight-indent-guides-mode
  :init
  (setq highlight-indent-guides-method 'bitmap
        ;; default is \x2502 but it is very slow on Mac
        ;;highlight-indent-guides-character ?\xFFE8
        highlight-indent-guides-responsive 'top
        highlight-indent-guides-bitmap-function 'highlight-indent-guides--bitmap-line))

(use-package indent-bars
  :vc (:fetcher github :repo jdtsmith/indent-bars))

;; Backups
(customize-set-variable 'create-lockfiles nil)
(customize-set-variable 'make-backup-files t)
(customize-set-variable 'version-control t)
(customize-set-variable 'backup-by-copying t)
(customize-set-variable 'delete-old-versions t)
(customize-set-variable 'kept-old-versions 5)
(customize-set-variable 'kept-new-versions 5)
(customize-set-variable 'backup-directory-alist `(("." . "~/.cache/emacs/saves")))
(customize-set-variable 'tramp-backup-directory-alist backup-directory-alist)

;; History
(use-package recentf
  :hook (emacs-startup . recentf-mode)
  :custom
  (recentf-max-menu-items 25)
  (recentf-max-saved-items 25)
  :config
  (run-at-time nil (* 5 60) 'recentf-save-list))

(use-package savehist
  :hook (emacs-startup . savehist-mode)
  :custom
  (savehist-save-minibuffer-history t)
  (savehist-autosave-interval nil)
  (savehist-additional-variables '(kill-ring
                                   register-alist
                                   mark-ring global-mark-ring
                                   search-ring regexp-search-ring)))

(use-package super-save
  :defer 2
  :diminish super-save-mode
  :config
  (super-save-mode +1)
  :custom
  (super-save-exclude '(".go"))
  (super-save-remote-files nil)
  (auto-save-default nil)
  (super-save-auto-save-when-idle t))

;; Center content
(use-package perfect-margin
  :custom
  (perfect-margin-visible-width 128)
  ;; auto-center minibuffer windows
  (perfect-margin-ignore-filters nil)
  ;; auto-center special windows
  (perfect-margin-ignore-regexps nil)
  :config
  ;; enable perfect-mode
  (perfect-margin-mode t)
  ;; add additinal binding on margin area
  (dolist (margin '("<left-margin> " "<right-margin> "))
  (global-set-key (kbd (concat margin "<mouse-1>")) 'ignore)
  (global-set-key (kbd (concat margin "<mouse-3>")) 'ignore)
  (dolist (multiple '("" "double-" "triple-"))
      (global-set-key (kbd (concat margin "<" multiple "wheel-up>")) 'mwheel-scroll)
      (global-set-key (kbd (concat margin "<" multiple "wheel-down>")) 'mwheel-scroll))))

(use-package rg)

(provide 'init-editor)
