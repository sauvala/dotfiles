;;; $DOOMDIR/con***REMOVED***g.el -*- lexical-binding: t; -*-

;; Place your private con***REMOVED***guration here! Remember, you do not need to run 'doom
;; sync' after modifying this ***REMOVED***le!


;; Some functionality uses this to identify you, e.g. GPG con***REMOVED***guration, email
;; clients, ***REMOVED***le templates and snippets.
(setq user-full-name "Janne Sauvala"
      user-mail-address "janne.sauvala@gmail.com")

;; Doom exposes ***REMOVED***ve (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetBrains Mono" :size 14 :weight 'semi-light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)


;; doom-modeline
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-***REMOVED***le-name-style 'relative-to-project)
(setq doom-modeline-display-default-persp-name t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-modal-icon nil)
(setq doom-modeline-checker-simple-format t)
(setq doom-modeline-window-width-limit ***REMOVED***ll-column)

;; add spacing to end of the main modeline so it doesn't cut off checker
;; the icons are taking too much space and pushes content too much to the right
(after! doom-modeline
 (doom-modeline-def-modeline 'main
  '(bar workspace-name window-number modals matches buffer-info remote-host buffer-position word-count parrot selection-info)
  '(objed-state misc-info persp-name battery grip irc mu4e gnus github debug repl lsp minor-modes input-method indent-info buffer-encoding major-mode process vcs checker "  ")))


;; If you use `org' and don't want your org ***REMOVED***les in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you con***REMOVED***gure Doom:
;;
;; - `load!' for loading external *.el ***REMOVED***les relative to this one
;; - `use-package!' for con***REMOVED***guring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this ***REMOVED***le. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their de***REMOVED***nition and see how
;; they are implemented.
