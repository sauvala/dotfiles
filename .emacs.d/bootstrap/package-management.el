;;;; package-management.el --- Autocompile emacs-lisp code  -*- lexical-binding: t; -*-
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq use-package-always-defer t)
(setq use-package-always-ensure t)

(provide 'package-management)
