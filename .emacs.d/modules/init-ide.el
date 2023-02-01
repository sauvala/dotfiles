;;;; init-ide.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Golang
(elpaca-use-package go-mode)
(elpaca-use-package gotest)

;; Rust
(elpaca-use-package rustic)
  ;;:custom
  ;;(rustic-lsp-client 'eglot)
(elpaca-use-package rust-mode)
(elpaca-use-package cargo)

;; LSP
(elpaca-use-feature eglot
  :custom
  (setq eglot-connect-timeout 10)
  :con***REMOVED***g
  (setq eglot-workspace-con***REMOVED***guration
        '((:gopls . (:usePlaceholders t))
          (:jdtsl . (:usePlaceholders t)))))

(elpaca-use-package lsp-mode
  :custom
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :con***REMOVED***g
  (lsp-rust-analyzer-inlay-hints-mode))

(elpaca-use-package lsp-ui)

;; Snippets / placeholders
(elpaca-use-package yasnippet)

;; Sidebar
(elpaca-use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

(provide 'init-ide)
