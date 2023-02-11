;;;; init-vc.el -*- lexical-binding: t; no-byte-compile: t; -*-

(customize-set-variable 'vc-follow-symlinks t)

(use-package magit
  :bind ("C-x g" . magit-status))

(provide 'init-vc)
