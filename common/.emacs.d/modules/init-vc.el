;;;; init-vc.el -*- lexical-binding: t; no-byte-compile: t; -*-

(customize-set-variable 'vc-follow-symlinks t)

(use-package magit
  :after (git-commit)
  :bind ("C-x g" . magit-status)
  :custom
  (magit-process-connection-type nil)
  (with-editor-emacsclient-executable "emacsclient")
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (magit-diff-refine-hunk 'all)
  (magit-log-auto-more t))

(use-package diff-hl
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package forge)

(use-package github-review)

(use-package keychain-environment
  :defer 3)

(defun my-vc-off-if-remote ()
  (if (file-remote-p (buffer-file-name))
      (setq-local vc-handled-backends nil)))
(add-hook 'find-file-hook 'my-vc-off-if-remote)

(setq remote-file-name-inhibit-locks t)

(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)

(use-package ediff
  :ensure nil
  :custom
  (ediff-split-window-function 'split-window-horizontally)
  (ediff-window-setup-function 'ediff-setup-windows-plain)
  (ediff-keep-variants nil)
  (ediff-merge-revisions-with-ancestor t)
  (ediff-show-clashes-only t))

(provide 'init-vc)
