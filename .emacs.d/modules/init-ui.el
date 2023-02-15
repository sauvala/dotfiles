;;;; init-ui.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled)
  :con***REMOVED***g
  ;; Global settings (defaults)
  
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-con***REMOVED***g)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-con***REMOVED***g)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-con***REMOVED***g)
  ;; Corrects (and improves) org-mode's native fonti***REMOVED***cation.
  (doom-themes-org-con***REMOVED***g))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package catppuccin)

(provide 'init-ui)
