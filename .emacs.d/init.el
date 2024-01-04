;;;; init.el -*- lexical-binding: t;  no-byte-compile: t; -*-

;; Keep customization settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "bootstrap" user-emacs-directory))
(require 'package-management)

;; Load modules
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'init-core)
(require 'init-ui)
(require 'init-completion)
(require 'init-minibuffer)
(require 'init-editor)
(require 'init-macos)
(require 'init-vc)
(require 'init-org)
(require 'init-ide)
(require 'init-terminal)
(require 'init-notes)
(require 'init-gpt)
(require 'init-media)

;; Load customization after all packages have been loaded
(load custom-file t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
