;;;; init-gpt.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package gptel
  :config
  (setq gptel-default-mode 'org-mode))

(use-package gptai)

(defvar js/chatgpt-shell-install-dir "~/.emacs.d/modules/chatgpt-shell/")
(when (file-exists-p js/chatgpt-shell-install-dir)
  (use-package chatgpt-shell
    :load-path js/chatgpt-shell-install-dir)
  (require 'chatgpt-shell))

(provide 'init-gpt)
