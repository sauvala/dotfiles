;;;; init-org.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package org
  :custom
  (org-hide-emphasis-markers t)
  (visual-wrap-prefix-mode t)
  (visual-line-mode t)
  (word-wrap t)
  :config
  (visual-wrap-prefix-mode))

(provide 'init-org)
