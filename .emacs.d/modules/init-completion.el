;;;; init-completion.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package emacs-completion
  :ensure nil
  :defer 1
  :custom
  (completion-auto-help 'always))

(use-package orderless
  :defer 1
  :init
  (setq completion-category-defaults nil)
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((***REMOVED***le (styles . (partial-completion))))))

(use-package consult
  :defer 1
  :bind (("C-s" . consult-line)
	       ("C-M-l" . consult-imenu)
	       ("M-p" . consult-yank-from-kill-ring)
         ("C-c f r" . consult-recent-***REMOVED***le)
         ("C-x b" . consult-buffer)
         ("C-c b" . consult-bookmark)
	       :map minibuffer-local-map
	       ("C-r" . consult-history))
  :custom
  (completion-in-region-function #'consult-completion-in-region)
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-de***REMOVED***nitions-function #'consult-xref)
  :con***REMOVED***g
  (require 'consult-imenu)
  (require 'consult-xref))

(use-package consult-dir
  :after (consult)
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-***REMOVED***le))
  :con***REMOVED***g
  (add-to-list 'consult-dir-sources 'consult-dir--source-tramp-ssh t))

(use-package which-key
  :hook (emacs-startup . which-key-mode)
  :init
  (setq which-key-idle-delay 0.25))

(use-package corfu
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))
  :bind
  (:map corfu-map
        ("C-j" . corfu-next)
        ("C-k" . corfu-previous)
        ("H-j" . corfu-next)
        ("H-k" . corfu-previous)
        ("TAB" . corfu-insert))
  :custom
  (corfu-auto t)
  (corfu-cycle nil)
  (corfu-separator ?\s)
  (corfu-quit-at-boundary 'separator)
  (corfu-quit-no-match 'separator)
  (corfu-on-exact-match 'insert)
  (corfu-preview-current 'insert)
  (corfu-echo-documentation '(1.0 . 0.2))
  (corfu-preselect-***REMOVED***rst t))

(use-package corfu-doc
  :after (corfu)
  :con***REMOVED***g
  (corfu-doc-mode))

(use-package svg-lib)

(use-package kind-icon
  :after (corfu)
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  ;; (kind-icon-blend-frac 0.08)
  ;; (svg-lib-icons-dir (no-littering-expand-var-***REMOVED***le-name "svg-lib/cache/")) ; Change cache dir
  :con***REMOVED***g
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p f" . cape-***REMOVED***le)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p i" . cape-ispell)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p \\" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-***REMOVED***le)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
)

(provide 'init-completion)
