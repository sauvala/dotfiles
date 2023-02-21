;;;; init-vc.el -*- lexical-binding: t; no-byte-compile: t; -*-

(customize-set-variable 'vc-follow-symlinks t)

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package diff-hl
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'init-vc)
