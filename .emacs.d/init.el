;;;; init.el -*- lexical-binding: t;  no-byte-compile: t; -*-

;; Set ***REMOVED***le for customize
(setq custom-***REMOVED***le (locate-user-emacs-***REMOVED***le "custom.el"))

;; Keep customization settings in a separate ***REMOVED***le
(setq custom-***REMOVED***le
    (if (boundp 'server-socket-dir)
        (expand-***REMOVED***le-name "custom.el" server-socket-dir)
    (expand-***REMOVED***le-name (format "emacs-custom-%s.el" (user-uid)) temporary-***REMOVED***le-directory)))

(load custom-***REMOVED***le t)

;; Load modules
(add-to-list 'load-path (expand-***REMOVED***le-name "modules" user-emacs-directory))

(require 'init-completion)
(require 'init-minibuffer)
(require 'init-editor)
(require 'init-macos)
(require 'init-vc)
(require 'init-org)
(require 'init-ide)
