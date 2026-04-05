;;;; init-notes.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package markdown-mode)

(use-package denote
  :custom
  (denote-directory "~/Library/CloudStorage/GoogleDrive-janne.sauvala@gmail.com/My Drive/denote"))

(use-package polymode
  :config
  (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode))

(use-package org-modern)

(use-package grip-mode)

(provide 'init-notes)
