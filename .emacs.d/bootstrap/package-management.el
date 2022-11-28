;;;; package-management.el --- Autocompile emacs-lisp code  -*- lexical-binding: t; -*-

;; Initializes elpaca and makes it to use its use-package integration

(declare-function elpaca-generate-autoloads "elpaca")
(defvar elpaca-directory (expand-***REMOVED***le-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-***REMOVED***le-name "builds/" elpaca-directory))
(when-let ((elpaca-repo (expand-***REMOVED***le-name "repos/elpaca/" elpaca-directory))
           (elpaca-build (expand-***REMOVED***le-name "elpaca/" elpaca-builds-directory))
           (elpaca-target (if (***REMOVED***le-exists-p elpaca-build) elpaca-build elpaca-repo))
           (elpaca-url  "https://www.github.com/progfolio/elpaca.git")
           ((add-to-list 'load-path elpaca-target))
           ((not (***REMOVED***le-exists-p elpaca-repo)))
           (buffer (get-buffer-create "*elpaca-bootstrap*")))
  (condition-case-unless-debug err
      (progn
        (unless (zerop (call-process "git" nil buffer t "clone" elpaca-url elpaca-repo))
          (error "%s" (list (with-current-buffer buffer (buffer-string)))))
        (byte-recompile-directory elpaca-repo 0 'force)
        (require 'elpaca)
        (elpaca-generate-autoloads "elpaca" elpaca-repo)
        (kill-buffer buffer))
    ((error)
     (delete-directory elpaca-directory 'recursive)
     (with-current-buffer buffer
       (goto-char (point-max))
       (insert (format "\n%S" err))
       (display-buffer buffer)))))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :host github :repo "progfolio/elpaca"))
(elpaca use-package (require 'use-package))

(defmacro elpaca-use-feature (name &rest args)
  "Like `use-package' but accounting for asynchronous installation.
NAME and ARGS are in `use-package'."
  (declare (indent defun))
  `(elpaca nil (use-package ,name
                 :ensure nil
                 ,@args)))

(provide 'package-management)
