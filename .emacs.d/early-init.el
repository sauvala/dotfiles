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
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
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
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      ns-use-proxy-icon nil)



;; (add-hook 'after-init-hook (lambda () (load-theme 'doom-solarized-dark)))

;; (customize-set-variable 'initial-major-mode 'fundamental-mode)


;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))


