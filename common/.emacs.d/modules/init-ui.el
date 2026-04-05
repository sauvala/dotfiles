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

;; Make modeline a little narrower
;(set-face-attribute 'mode-line nil :height 155)
;(set-face-attribute 'mode-line-inactive nil :height 155)

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

(use-package nerd-icons)

(use-package nerd-icons-completion
  :hook (marginalia-mode . nerd-icons-completion-mode)
  :config
  (nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package buffer-move)

(use-package transpose-frame)

(use-package breadcrumb)

(use-package spacious-padding)

;;(use-package window-stool
;;  :vc (:url "https://github.com/JasZhe/window-stool.git"))

(use-package mixed-pitch)

;; Try out Monaspace font with textual healing
;; https://github.com/mickeynp/ligature.el/issues/53#issuecomment-1828732077
;; set safe composition table that works in all modes:
(set-char-table-range composition-function-table t `(["[,-.;A-Z_a-z]+" 0 font-shape-gstring]))

;; creates and sets a buffer local composition table to value
(defun set-buffer-local-composition-table (value)
  (let ((table (make-char-table nil)))
    (set-char-table-range table t `([,value 0 font-shape-gstring]))
    (set-char-table-parent table composition-function-table)
    (setq-local composition-function-table table)))

;; sets prog-mode composition table - includes programming ligatures
(defun set-prog-mode-table ()
  (set-buffer-local-composition-table "[-.,:;A-Z_a-z><=!&|+?/\\]+"))

;; Turn on ligatures in all programming modes:
(add-hook 'prog-mode-hook #'set-prog-mode-table)

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

(use-package ultra-scroll
  :vc (:url "https://github.com/jdtsmith/ultra-scroll.git"
       :rev :newest)
  :hook emacs-startup-hook
  :init
  (setq scroll-conservatively 101 ; important!
        scroll-margin 0) 
  :config
  (ultra-scroll-mode 1))

;; Set fonts
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             ;;`(default ((t (:font "Iosevka Comfy 18"))))
             ;;`(default ((t (:font "JetBrainsMono Nerd Font 15"))))
             ;;`(default ((t (:font "MonaspiceAr Nerd Font 18"))))
             ;;`(default ((t (:font "MonaspaceAr Nerd Font Mono 18"))))
             ;;`(default ((t (:font "Monaspace Neon Frozen 17"))))
             ;;`(default ((t (:font "CommitMono Nerd Font 17"))))
             ;;`(default ((t (:font "MonaspiceNe Nerd Font Mono 17"))))
             ;;`(default ((t (:font "CommitMono Nerd Font 15"))))
             ;;`(default ((t (:font "CommitMono 15"))))
             ;;`(default ((t (:font "Monaspace Neon" :foundry "nil" :slant normal :weight normal :height 150 :width normal))))
             ;;`(fixed-pitch ((t (:inherit (default)))))
             ;;`(fixed-pitch-serif ((t (:inherit (default)))))
             ;;`(variable-pitch ((t (:font "Monaspace Neon Var 16"))))
             ;;`(variable-pitch ((t (:font "Iosevka Aile 16"))))
             ;;`(variable-pitch ((t (:font "Iosevka Etoile 15"))))
             )))

(use-package visual-fill-column
  :custom
  (visual-fill-column-width 70)
  (visual-fill-column-center-text t)
  (visual-fill-column-fringes-outside-margins t)
  (visual-fill-column-enable-sensible-window-split t))

(use-package tomorrow-night-deepblue-theme)

(use-package vim-tab-bar
  :commands vim-tab-bar-mode
  :hook
  (after-init . vim-tab-bar-mode))

(use-package treemacs)

(use-package treemacs-nerd-icons
  :demand
  :config
  (treemacs-nerd-icons-config))

(use-package dirvish)

(provide 'init-ui)
