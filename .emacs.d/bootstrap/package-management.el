;;;; package-management.el --- Setup package management -*- lexical-binding: t; -*-

(use-package package
  :custom
  (use-package-always-defer t)
  (use-package-always-ensure t)
  :config
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))

;; Disable native compilation warnings
(use-package js-native-compilation
  :ensure nil
  :custom
  (native-comp-async-report-warnings-errors nil))

(unless (package-installed-p 'vc-use-package)
  (package-vc-install "https://github.com/slotThe/vc-use-package"))
(require 'vc-use-package)

(provide 'package-management)
