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
  :ensure nil
  :preface
  (defun js-eglot-eldoc ()
    (setq eldoc-documentation-strategy
          'eldoc-documentation-compose-eagerly))
  :hook
  ((eglot-managed-mode . js-eglot-eldoc))
  :bind
  (("M-." . xref-find-definitions))
  :custom
  (eglot-connect-timeout nil)
  (eglot-sync-connect nil)
  (eglot-autoshutdown t)
  (eglot-send-changes-idle-time 3)
  (flymake-no-changes-timeout 5)
  (eldoc-echo-area-use-multiline-p nil)
  (fset #'jsonrpc--log-event #'ignore)
  ;(eglot-events-buffer-size 0)
  (eglot-events-buffer-config '(:size 0 :format full))
  ;(eglot-ignored-server-capabilites '(:documentHighlightProvider))
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
  (add-to-list 'eglot-server-programs '((python-mode python-ts-mode) "basedpyright-langserver" "--stdio"))
  (setq-default
       eglot-workspace-configuration
       '(:basedpyright (
           :typeCheckingMode "recommended"
         )
         :basedpyright.analysis (
           :diagnosticSeverityOverrides (:reportUnusedCallResult "none")
           :inlayHints (:callArgumentNames t))))
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("uvx" "ty" "server")))
  (add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode))

(use-package eglot-booster
  :after eglot
  :vc (:url "https://github.com/jdtsmith/eglot-booster.git"
       :rev :newest)
  :config
  (eglot-booster-mode))

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

(use-package dired-subtree
  :after dired
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-toggle)))

(use-package treesit-auto
  ;;:hook emacs-startup-hook
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

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

(use-package swift-mode)
(use-package eros)

(use-package editorconfig
  :ensure nil
  :hook (prog-mode . editorconfig-mode))

(use-package flymake-ruff
  :hook (python-mode . flymake-ruff-load))

(use-package leetcode
  :custom
  (leetcode-prefer-language "python3")
  (leetcode-save-solutions t)
  (leetcode-directory "~/Documents/leetcode"))

(provide 'init-ide)
