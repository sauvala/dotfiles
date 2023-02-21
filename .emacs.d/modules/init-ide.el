;;;; init-ide.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Golang
(use-package go-mode)
(use-package gotest)

;; Rust
(use-package rustic)
  ;;:custom
  ;;(rustic-lsp-client 'eglot)
(use-package rust-mode)
(use-package cargo)

;; LSP
(use-package eglot
  :preface
  (defun js-eglot-eldoc ()
    (setq eldoc-documentation-strategy
          'eldoc-documentation-compose-eagerly))
  :hook
  ((eglot-managed-mode . js-eglot-eldoc))
  :custom
  (eglot-connect-timeout 10)
  :con***REMOVED***g
  (setq eglot-workspace-con***REMOVED***guration
        '((:gopls . (:usePlaceholders t))
          (:jdtsl . (:usePlaceholders t)))))

(use-package lsp-mode
  :custom
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :con***REMOVED***g
  (lsp-rust-analyzer-inlay-hints-mode))

(use-package lsp-ui)

(use-package terraform-mode)

;; Snippets & placeholders
(use-package yasnippet
  :after eglot
  :con***REMOVED***g
  (yas-global-mode 1))

;; Sidebar
(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

;; Icons for Dired and dired-sidebar
(use-package all-the-icons-dired
  :hook (dired-mode-hook . all-the-icons-dired-mode))

(use-package treesit-auto
  :con***REMOVED***g
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(provide 'init-ide)
