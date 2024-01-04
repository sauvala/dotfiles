;;;; init-ide.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Golang
(use-package go-mode)
(use-package gotest)
(use-package go-ts-mode
  :custom
  (go-ts-mode-indent-offset 2))

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

;; childframe doc for eglot and anything that uses eldoc
(use-package eldoc-box)

(use-package terraform-mode)

(use-package protobuf-mode)

(use-package protobuf-ts-mode)

(use-package jenkinsfile-mode)

;; Snippets & placeholders
(use-package yasnippet
  :after eglot
  :config
  (yas-global-mode 1))

;; Sidebar
(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar)
  :custom
  (dired-sidebar-width 40)
  (dired-sidebar-should-follow-file t))

;; Icons for Dired and dired-sidebar
(use-package all-the-icons-dired
  :hook (dired-mode-hook . all-the-icons-dired-mode))

(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(use-package dumb-jump
  :custom
  (dumb-jump-prefer-searcher 'rg)
  (dumb-jump-force-searcher 'rg)
  (xref-show-definitions-function #'consult-xref)
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package js-elisp-mode
  :ensure nil
  :defer 4
  :config
  (define-advice elisp-get-fnsym-args-string (:around (orig-fun sym &rest r) docstring)
  "If SYM is a function, append its docstring."
  (concat
   (apply orig-fun sym r)
   (let* ((doc (and (fboundp sym) (documentation sym 'raw)))
          (oneline (and doc (substring doc 0 (string-match "\n" doc)))))
     (and oneline
          (stringp oneline)
          (not (string= "" oneline))
          (concat "  |  " (propertize oneline 'face 'italic)))))))

(use-package eros)

(provide 'init-ide)
