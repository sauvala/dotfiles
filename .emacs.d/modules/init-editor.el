;;;; init-editor.el -*- lexical-binding: t; no-byte-compile: t; -*-

(setq create-lock***REMOVED***les nil
      make-backup-***REMOVED***les t
      version-control t
      backup-by-copying t
      delete-old-versions t
      kept-old-versions 5
      kept-new-versions 5
      backup-directory-alist `(("." . "~/.cache/emacs/saves"))
      tramp-backup-directory-alist backup-directory-alist)

(elpaca-use-feature savehist
  :hook (emacs-startup . savehist-mode)
  :con***REMOVED***g
  (setq savehist-save-minibuffer-history t
        savehist-autosave-interval nil
        savehist-additional-variables
        '(kill-ring
          register-alist
          mark-ring global-mark-ring
          search-ring regexp-search-ring)))

(provide 'init-editor)
