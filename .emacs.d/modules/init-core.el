 ;;;; init-core.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package gcmh
  :hook (emacs-startup . gcmh-mode))

(use-package emacs-gc-stats
  :config
  (emacs-gc-stats-mode +1))

(use-package exec-path-from-shell
  :defer 2
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (when (daemonp)
    (exec-path-from-shell-initialize)))

(provide 'init-core)
