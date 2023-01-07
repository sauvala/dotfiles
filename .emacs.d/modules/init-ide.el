;;;; init-ide.el -*- lexical-binding: t; no-byte-compile: t; -*-

;; Golang
(elpaca-use-package go-mode)
(elpaca-use-package gotest)

;; LSP
(elpaca-use-feature eglot
  :custom
  (setq eglot-connect-timeout 10)
  :con***REMOVED***g
  (setq eglot-workspace-con***REMOVED***guration
        '((:gopls . (:usePlaceholders t))
          (:jdtsl . (:usePlaceholders t)))))

(elpaca-use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

(provide 'init-ide)
