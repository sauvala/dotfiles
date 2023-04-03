;;;; init.el -*- lexical-binding: t;  no-byte-compile: t; -*-

(add-to-list 'load-path (expand-file-name "bootstrap" user-emacs-directory))
(require 'package-management)

;; Set file for customize
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Keep customization settings in a separate file
(setq custom-file
    (if (boundp 'server-socket-dir)
        (expand-file-name "custom.el" server-socket-dir)
    (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

(load custom-file t)

;; Load modules
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'init-core)
(require 'init-completion)
(require 'init-minibuffer)
(require 'init-editor)
(require 'init-macos)
(require 'init-vc)
(require 'init-org)
(require 'init-ide)
(require 'init-terminal)
(require 'init-ui)
(require 'init-notes)
(require 'init-gpt)
(require 'init-media)
