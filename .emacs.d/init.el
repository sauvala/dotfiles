(add-to-list 'load-path (expand-***REMOVED***le-name "modules" user-emacs-directory))

(setq custom-***REMOVED***le (locate-user-emacs-***REMOVED***le "custom.el"))

(require 'org-notes)
(require 'version-control)


(when (***REMOVED***le-exists-p custom-***REMOVED***le)
  (load custom-***REMOVED***le))

;; Make GC pauses faster by decreasing the threshold
(setq gc-cons-threshold (* 2 1000 1000))

