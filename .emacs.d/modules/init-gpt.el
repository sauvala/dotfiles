;;;; init-gpt.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package gptel
  :config
  (setq gptel-default-mode 'org-mode))

(use-package gptai)

(use-package chatgpt-shell
  :load-path "~/.emacs.d/modules/chatgpt-shell/")
(require 'chatgpt-shell)

(provide 'init-gpt)
