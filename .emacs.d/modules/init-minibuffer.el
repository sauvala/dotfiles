;;;; init-minibuffer.el -*- lexical-binding: t; no-byte-compile: t; -*-

(setq enable-recursive-minibuffers t)

(if (boundp 'use-short-answers)
    (setq use-short-answers t))

(use-package vertico
  :defer 0.1
  :bind (:map vertico-map
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("H-j" . vertico-next)
              ("H-k" . vertico-previous)
              ("C-f" . vertico-exit)
              :map minibuffer-local-map
              ("M-h" . js/minibuffer-backward-kill))
  :custom
  (vertico-cycle nil)
  :con***REMOVED***g
  (vertico-mode))

(use-package marginalia
  :after (vertico)
  ;; :custom
  ;; (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook (emacs-startup . marginalia-mode)
  :init (marginalia-mode))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup))

(provide 'init-minibuffer)
