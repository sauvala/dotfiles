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

;; Indentation guides
(elpaca-use-package highlight-indent-guides
  :hook prog-mode
  :delight highlight-indent-guides-mode
  :init
  (setq highlight-indent-guides-method 'character
        ;; default is \x2502 but it is very slow on Mac
        highlight-indent-guides-character ?\xFFE8
        highlight-indent-guides-responsive 'top))

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
(elpaca-use-package recentf
  :hook (emacs-startup . recentf-mode)
  :custom
  (recentf-max-menu-items 25)
  (recentf-max-saved-items 25)
  :con***REMOVED***g
  (run-at-time nil (* 5 60) 'recentf-save-list))

(elpaca-use-feature savehist
  :hook (emacs-startup . savehist-mode)
  :custom
  (savehist-save-minibuffer-history t)
  (savehist-autosave-interval nil)
  (savehist-additional-variables '(kill-ring
                                   register-alist
                                   mark-ring global-mark-ring
                                   search-ring regexp-search-ring)))

(elpaca-use-package super-save
  :defer 2
  :diminish super-save-mode
  :con***REMOVED***g
  (super-save-mode +1)
  (setq super-save-exclude '(".go"))
  (setq super-save-remote-***REMOVED***les nil)
  (setq auto-save-default nil)
  :custom
  (super-save-auto-save-when-idle t))

(provide 'init-editor)
