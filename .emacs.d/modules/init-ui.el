;;;; init-ui.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package helpful
  :defer 2
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
  
   ;; Lookup the current symbol at point. C-c C-d is a common keybinding
   ;; for this in lisp modes.
   ("C-c C-d" . helpful-at-point)
   
   ;; Look up *F*unctions (excludes macros).
   ;
   ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
   ;; already links to the manual, if a function is referenced there.
   ("C-h F" . helpful-function)

   ;; Look up *C*ommands.
   ;;
   ;; By default, C-h C is bound to describe `describe-coding-system'. I
   ;; don't find this very useful, but it's frequently useful to only
   ;; look at interactive functions.
   ("C-h C" . helpful-command)))

(use-package ef-themes)

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled)
  :config
  ;; Global settings (defaults)
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :custom
  (doom-modeline-height 20)
  :hook (after-init . doom-modeline-mode))

;; Make modeline a little narrower
(set-face-attribute 'mode-line nil :height 155)
(set-face-attribute 'mode-line-inactive nil :height 155)

(use-package catppuccin-theme)

(use-package buffer-move)

(use-package transpose-frame)

(provide 'init-ui)
