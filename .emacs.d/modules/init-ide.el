;;;; init-ide.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Golang
(use-package go-mode)
(use-package gotest)

;; Javascript
(use-package js
  :ensure nil
  :bind ([remap js-find-symbol] . xref-find-definitions)
  :custom (js-indent-level 2))
(use-package js2-mode)

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
  :bind
  (("M-." . xref-find-definitions))
  :custom
  (eglot-connect-timeout 10)
  :config
  (setq eglot-workspace-configuration
        '((:gopls . (:usePlaceholders t))
          (:jdtsl . (:usePlaceholders t))))
  (add-to-list 'eglot-server-programs '((go-mode go-ts-mode) .
    ("gopls" :initializationOptions
      (:hints (:parameterNames t
               :rangeVariableTypes t
               :functionTypeParameters t
               :assignVariableTypes t
               :compositeLiteralFields t
               :compositeLiteralTypes t
               :constantValues t)))))
  (add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode))

(use-package lsp-mode
  :custom
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (lsp-rust-analyzer-inlay-hints-mode))

(use-package lsp-ui)

(use-package terraform-mode)

(use-package protobuf-mode)

(use-package protobuf-ts-mode)

;; Snippets & placeholders
(use-package yasnippet
  :after eglot
  :config
  (yas-global-mode 1))

;; Sidebar
(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar)
  :custom
  (dired-sidebar-with 45)
  (dired-sidebar-should-follow-file t))

;; Icons for Dired and dired-sidebar
(use-package all-the-icons-dired
  :hook (dired-mode-hook . all-the-icons-dired-mode))

(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(provide 'init-ide)
