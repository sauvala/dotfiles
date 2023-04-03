;;;; init-notes.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package markdown-mode)

(use-package org-roam
  :custom
  (org-roam-directory "/Users/jannesauvala/Sync/Org/org-roam/")
  (org-roam-completion-everywhere t)
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n c" . org-id-get-create))
  :config
  (org-roam-setup))

(use-package org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package grip-mode)

(provide 'init-notes)
