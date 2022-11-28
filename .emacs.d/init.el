;; Load custom values
(setq custom-***REMOVED***le (locate-user-emacs-***REMOVED***le "custom.el"))
(when (***REMOVED***le-exists-p custom-***REMOVED***le)
  (load custom-***REMOVED***le))

;; Load modules
(add-to-list 'load-path (expand-***REMOVED***le-name "modules" user-emacs-directory))
(require 'init-org)
(require 'init-completion)
(require 'init-minibuffer)
(require 'init-vc)
(require 'init-editor)
(require 'init-macos)

;; Make GC pauses faster by decreasing the threshold
(setq gc-cons-threshold (* 2 1000 1000))

