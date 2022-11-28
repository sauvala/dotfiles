;;; early-init.el -*- lexical-binding: t; -*-

;;; Garbage collection and perf tuning
(setq gc-cons-threshold (* 50 1000 1000))
(setq inhibit-compacting-font-caches t)
(setq read-process-output-max 65536) ; (* 64 1024)

;;; Prefer loading newest compiled .el ***REMOVED***le
(customize-set-variable 'load-prefer-newer noninteractive)

;;; Packages
(setq package-enable-at-startup nil)

;;; Emacs lisp source/compiled preference
;; Prefer loading newest compiled .el ***REMOVED***le
(customize-set-variable 'load-prefer-newer noninteractive)

;;; UI
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(mouse-color . "white") default-frame-alist)
(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(ns-appearance . dark) default-frame-alist)

;; Frame size
(add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 240))

(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message "janne"
      inhibit-startup-buffer-menu t
      initial-scratch-message nil
      visible-bell t
      frame-inhibit-implied-resize t
      frame-resize-pixelwise t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      ns-use-proxy-icon nil)

;; Load theme
(load-theme 'deeper-blue t)

;; Set fonts
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             `(default ((t (:font "Iosevka Comfy 16"))))
             `(***REMOVED***xed-pitch ((t (:inherit (default)))))
             `(***REMOVED***xed-pitch-serif ((t (:inherit (default)))))
             `(variable-pitch ((t (:font "Iosevka Comfy Duo 16")))))))

;; Setup package management
(add-to-list 'load-path (expand-***REMOVED***le-name "bootstrap" user-emacs-directory))
(require 'package-management)


;; (add-hook 'after-init-hook (lambda () (load-theme 'doom-solarized-dark)))

;; (customize-set-variable 'initial-major-mode 'fundamental-mode)


;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))


