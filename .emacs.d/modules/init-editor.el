;;;; init-editor.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Set tab behaviour
(customize-set-variable 'tab-width 2)
(customize-set-variable 'indent-tabs-mode nil)

;; Smooth scrolling
(pixel-scroll-precision-mode)

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

;; Undoing window con***REMOVED***guration changes
(use-package winner
  :hook emacs-startup)

;; Window movement
(use-package windmove
  :defer 1.5
  :con***REMOVED***g
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

;; Backups
(customize-set-variable 'create-lock***REMOVED***les nil)
(customize-set-variable 'make-backup-***REMOVED***les t)
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
  :con***REMOVED***g
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
  :con***REMOVED***g
  (super-save-mode +1)
  :custom
  (super-save-exclude '(".go"))
  (super-save-remote-***REMOVED***les nil)
  (auto-save-default nil)
  (super-save-auto-save-when-idle t))

;; Center content
(use-package perfect-margin
  :custom
  (perfect-margin-visible-width 128)
  ;; auto-center minibuffer windows
  (perfect-margin-ignore-***REMOVED***lters nil)
  ;; auto-center special windows
  (perfect-margin-ignore-regexps nil)
  :con***REMOVED***g
  ;; enable perfect-mode
  (perfect-margin-mode t)
  ;; add additinal binding on margin area
  (dolist (margin '("<left-margin> " "<right-margin> "))
  (global-set-key (kbd (concat margin "<mouse-1>")) 'ignore)
  (global-set-key (kbd (concat margin "<mouse-3>")) 'ignore)
  (dolist (multiple '("" "double-" "triple-"))
      (global-set-key (kbd (concat margin "<" multiple "wheel-up>")) 'mwheel-scroll)
      (global-set-key (kbd (concat margin "<" multiple "wheel-down>")) 'mwheel-scroll))))

(provide 'init-editor)
