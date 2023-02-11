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
  :custom
  (setq eglot-connect-timeout 10)
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

;; Snippets / placeholders
(use-package yasnippet)

;; Sidebar
(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

(provide 'init-ide)
