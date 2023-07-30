 ;;;; init-core.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package gcmh
  :hook (emacs-startup . gcmh-mode))

(use-package emacs-gc-stats
  :config
  (emacs-gc-stats-mode +1))

(provide 'init-core)
