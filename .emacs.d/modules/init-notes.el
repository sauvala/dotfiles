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

(use-package org-brain
  :init
  (setq org-brain-path "/Users/jannesauvala/Google Drive/My Drive/Org/org-brain")
  :config
  (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil))

(use-package polymode
  :config
  (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode))

(use-package org-modern)

(use-package grip-mode)

(provide 'init-notes)
