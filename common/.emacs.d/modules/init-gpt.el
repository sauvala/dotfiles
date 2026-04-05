;;;; init-gpt.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package gptel
  :custom
  (gptel-default-mode 'org-mode)
  :config
  (gptel-make-azure
    "UAI"
    :protocol "https"
    :host "openai-janne-sauvala.openai.azure.com"
    :endpoint
    "/openai/deployments/gpt-4-1106-preview/chat/completions?api-version=2024-02-01"
    :models '("gpt-4-1106-preview")
    :stream t)
  (gptel-make-azure
    "UAIO"
    :protocol "https"
    :host "openai-janne-sauvala-eus.openai.azure.com"
    :endpoint
    "/openai/deployments/got4o/chat/completions?api-version=2024-02-01"
    :models '("got4o")
    :stream t)
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response))

(use-package monet
  :vc (:url "https://github.com/stevemolitor/monet" :rev :newest)
  :custom
  (monet-diff-tool #'monet-ediff-tool)
  (monet-diff-cleanup-tool #'monet-ediff-cleanup-tool))

(use-package claude-code
  :vc (:url "https://github.com/stevemolitor/claude-code.el" :rev :newest)
  :config 
  ;; optional IDE integration with Monet
  (add-hook 'claude-code-process-environment-functions #'monet-start-server-function)
  (monet-mode 1)
  (claude-code-mode)
  :bind-keymap ("C-c c" . claude-code-command-map)
  ;; Optionally define a repeat map so that "M" will cycle thru Claude auto-accept/plan/confirm modes after invoking claude-code-cycle-mode / C-c M.
  :bind
  (:repeat-map my-claude-code-map ("M" . claude-code-cycle-mode)))

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :custom
  (claude-code-ide-terminal-backend 'eat)
  (claude-code-ide-enable-mcp-server t)
  :config
  (custom-set-faces
   '(claude-code-repl-face ((t (:family "JuliaMono"))))))


(use-package gptai)

(defvar js/chatgpt-shell-install-dir "~/.emacs.d/modules/chatgpt-shell/")
(when (file-exists-p js/chatgpt-shell-install-dir)
  (use-package chatgpt-shell
    :load-path js/chatgpt-shell-install-dir)
  (require 'chatgpt-shell))

(use-package eca)

(use-package shell-maker)

(use-package acp
  :vc (:url "https://github.com/xenodium/acp.el"))

(use-package agent-shell)

(provide 'init-gpt)
