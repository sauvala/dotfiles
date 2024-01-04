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

(use-package mood-line
  :config
  (mood-line-mode))

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function)
  (let ((line (face-attribute 'mode-line :underline)))
    (set-face-attribute 'mode-line          nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :underline  line)
    (set-face-attribute 'mode-line          nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :background "#f9f2d9")))

(use-package minions)

(use-package catppuccin-theme)

(use-package os1-theme
  :vc (:fetcher github :repo sashimacs/os1-theme)
  :defer 3)

(use-package nerd-icons)

(use-package nerd-icons-completion
  :hook (marginalia-mode . nerd-icons-completion-mode)
  :config
  (nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package buffer-move)

(use-package transpose-frame)

(use-package breadcrumb
  :vc (:fetcher github :repo joaotavora/breadcrumb))

;; Enable ligatures
(use-package ligature
  :hook (prog-mode . ligature-mode)
  :config
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%")))

;; Set fonts
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             ;;`(default ((t (:font "Iosevka Comfy 18"))))
             `(default ((t (:font "JetBrainsMono NF 18"))))
             ;;`(default ((t (:font "Monaspace Neon" :foundry "nil" :slant normal :weight normal :height 150 :width normal))))
             `(fixed-pitch ((t (:inherit (default)))))
             `(fixed-pitch-serif ((t (:inherit (default)))))
             ;; `(variable-pitch ((t (:font "Monaspace Neon Var 16"))))
             `(variable-pitch ((t (:font "Iosevka Comfy 16")))))))

(provide 'init-ui)
