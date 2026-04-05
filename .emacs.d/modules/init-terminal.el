;;;; init-terminal.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package vterm)

(use-package multi-vterm)

(use-package eat
  ;:custom
  ;(eat-tramp-shells '("bash"))
  ;(eat-ssh-shells '("bash"))
  ;(eat-shell '("bash" "-i" "-l"))
  )

(provide 'init-terminal)
