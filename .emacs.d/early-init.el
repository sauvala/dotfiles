;;;; early-init.el -*- lexical-binding: t;  no-byte-compile: t; -*-

;; Garbage collection and perf tuning
(setq gc-cons-threshold (* 50 1000 1000))
(setq read-process-output-max 65536) ; (* 64 1024)
(setq inhibit-compacting-font-caches t)

;; Make GC pauses faster by decreasing the threshold
(add-hook 'emacs-startup-hook (lambda ()
                                (customize-set-variable 'gc-cons-threshold (* 2 1000 1000))))

;; Emacs lisp source/compiled preference
;; Prefer loading newest compiled .el file
(customize-set-variable 'load-prefer-newer t)

;; Packages
;(setq package-enable-at-startup nil)

;; UI
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
