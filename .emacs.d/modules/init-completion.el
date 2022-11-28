;;;; init-completion.el -*- lexical-binding: t; -*-

(elpaca-use-package orderless
  :defer 0.1
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((***REMOVED***le (styles . (partial-completion))))))

(defun js/get-project-root ()
  (when-let (project (project-current))
    (car (project-roots project))))

(elpaca-use-package consult
  :bind (("C-s" . consult-line)
	 ("C-M-l" . consult-imenu)
	 ("M-p" . consult-yank-from-kill-ring)
	 :map minibuffer-local-map
	 ("C-r" . consult-history))
  :custom
  (consult-project-root-function #'js/get-project-root)
  (completion-in-region-function #'consult-completion-in-region))

(elpaca-use-package consult-dir
  :after (consult)
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-***REMOVED***le))
  :con***REMOVED***g
  (add-to-list 'consult-dir-sources 'consult-dir--source-tramp-ssh t))

(elpaca-use-package which-key
  :hook (emacs-startup . which-key-mode)
  :init
  (setq which-key-idle-delay 0.25))

(provide 'init-completion)
