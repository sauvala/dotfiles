;;; early-init.el -*- lexical-binding: t ; eval: (view-mode -1) -*-

(defvar js/gc-cons-threshold 16777216) ; 16mb
(setq gc-cons-threshold most-positive-***REMOVED***xnum
        gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold js/gc-cons-threshold
                  gc-cons-percentage 0.1)))

(defun js/defer-garbage-collection-h ()
  (setq gc-cons-threshold most-positive-***REMOVED***xnum))

(defun js/restore-garbage-collection-h ()
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold js/gc-cons-threshold))))

(add-hook 'minibuffer-setup-hook #'js/defer-garbage-collection-h)
(add-hook 'minibuffer-exit-hook #'js/restore-garbage-collection-h)

(setq read-process-output-max 65536) ; (* 64 1024)

(customize-set-variable 'load-prefer-newer noninteractive)

(when (featurep 'native-compile)
  (setq native-comp-async-report-warnings-errors nil)
  (setq native-comp-deferred-compilation t)

  (when (fboundp 'startup-redirect-eln-cache)
    (if (version< emacs-version "29")
        (add-to-list 'native-comp-eln-load-path (convert-standard-***REMOVED***lename (expand-***REMOVED***le-name "var/eln-cache/" user-emacs-directory)))
      (startup-redirect-eln-cache (convert-standard-***REMOVED***lename (expand-***REMOVED***le-name "var/eln-cache/" user-emacs-directory)))))

  (add-to-list 'native-comp-eln-load-path (expand-***REMOVED***le-name "eln-cache/" user-emacs-directory)))

(setq package-enable-at-startup nil
      package--init-***REMOVED***le-ensured t)

(defvar js--***REMOVED***le-name-handler-alist ***REMOVED***le-name-handler-alist)
(setq ***REMOVED***le-name-handler-alist nil)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq ***REMOVED***le-name-handler-alist js--***REMOVED***le-name-handler-alist)))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message "janne"
      inhibit-startup-buffer-menu t
      initial-scratch-message nil)
(set-fringe-mode 10)
(setq visible-bell t
      frame-inhibit-implied-resize t
      initial-major-mode 'fundamental-mode)

(setq ns-use-proxy-icon nil)
; (setq frame-title-format nil)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(set-frame-name (format "%s%s" (buffer-name)
                        (if-let (fn (buffer-***REMOVED***le-name))
                            (format " (%s)" (***REMOVED***le-name-directory fn))
                          "")))
(set-frame-name nil)
(setq frame-title-format '("%f [%m] - Emacs"))

(setq straight-use-package-by-default t
      use-package-always-defer t
      use-package-always-ensure t
      straight-cache-autoloads t
      ;; straight-check-for-modi***REMOVED***cations nil
      ;; use-package-verbose t
      )
;; (add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/"))
(defvar bootstrap-version)
(let ((bootstrap-***REMOVED***le
       (expand-***REMOVED***le-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (***REMOVED***le-exists-p bootstrap-***REMOVED***le)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-***REMOVED***le nil 'nomessage))

(straight-use-package 'use-package)

;; Load the helper package for commands like `straight-x-clean-unused-repos'
(require 'straight-x)

(use-package esup
  :commands esup
  :con***REMOVED***g
  (setq esup-user-init-***REMOVED***le (***REMOVED***le-truename "~/.emacs.d/init.el")))

(use-package gcmh
  :hook (emacs-startup . gcmh-mode)
  :con***REMOVED***g
  (gcmh-mode 1))

(provide 'early-init)
