;;;; init-minibuffer.el -*- lexical-binding: t; no-byte-compile: t; -*-

(setq enable-recursive-minibuffers t)

(if (boundp 'use-short-answers)
    (setq use-short-answers t))

(use-package vertico
  :defer 0.1
  :bind (:map vertico-map
              :map minibuffer-local-map
              ("M-h" . js/minibuffer-backward-kill))
  :custom
  (vertico-cycle nil)
  :config
  (vertico-mode))

(use-package vertico-posframe
  :after vertico)

(use-package marginalia
  :after vertico
  ;; :custom
  ;; (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(provide 'init-minibuffer)
