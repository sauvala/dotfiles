;;;; init-exercism.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package exercism
  :commands exercism
  :config
  (defun my-eval-and-run-all-tests-in-buffer ()
  "Deletes all loaded tests from the runtime, evaluates the current buffer and runs all loaded tests with ert."
  (interactive)
  (ert-delete-all-tests)
  (eval-buffer)
  (ert 't)))


(provide 'init-exercism)
