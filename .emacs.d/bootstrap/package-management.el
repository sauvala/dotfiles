;;;; package-management.el --- Autocompile emacs-lisp code  -*- lexical-binding: t; -*-

;; Disable native compilation warnings
(use-package native-compilation
  :ensure nil
  :custom
  (native-comp-async-report-warnings-errors nil))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq use-package-always-defer t)
(setq use-package-always-ensure t)

(unless (package-installed-p 'vc-use-package)
  (package-vc-install "https://github.com/slotThe/vc-use-package"))
(require 'vc-use-package)

(provide 'package-management)
