;;;; init.el -*- lexical-binding: t -*- no-byte-compile: t -*-
(add-to-list 'load-path (expand-***REMOVED***le-name "modules" user-emacs-directory))

;; Load modules
(require 'init-org)
(require 'init-completion)
(require 'init-minibuffer)
(require 'init-vc)
(require 'init-editor)
(require 'init-macos)


;; Try if disabling setting and loading custom.el helps

;;(setq custom-***REMOVED***le (locate-user-emacs-***REMOVED***le "custom.el"))

;; Load custom values
;;(when (***REMOVED***le-exists-p custom-***REMOVED***le)
;;  (load custom-***REMOVED***le))

;; Make GC pauses faster by decreasing the threshold
(setq gc-cons-threshold (* 2 1000 1000))

