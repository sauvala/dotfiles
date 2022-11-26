(add-to-list 'load-path (expand-***REMOVED***le-name "modules" user-emacs-directory))

(setq custom-***REMOVED***le (locate-user-emacs-***REMOVED***le "custom.el"))

(require 'version-control)
(require 'org)

(when (***REMOVED***le-exists-p custom-***REMOVED***le)
  (load custom-***REMOVED***le))

;; Make GC pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init ***REMOVED***le should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values '((org-duration-format . h:mm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init ***REMOVED***le should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
