;;;; init-tramp.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package tramp
  :ensure nil
  :custom
  (tramp-copy-size-limit (* 10240 2))
  (tramp-use-connection-share nil)
  :config
  ;;(setq tramp-default-method "rsync")
  (setq tramp-default-method "ssh")
  (setq remote-file-name-inhibit-locks t)
  (setq remote-file-name-inhibit-cache 180)
  (setq tramp-completion-reread-directory-timeout 180)
  (setq tramp-directory-cache-expire (* 60 60 24))
  (setq tramp-auto-save-directory nil)
  (setq vc-ignore-dir-regexp (format "%s\\|%s"
                                     vc-ignore-dir-regexp
                                     tramp-file-name-regexp))
  (setq tramp-ssh-controlmaster-options nil)
  (setq tramp-connection-timeout 10)
  (setq tramp-verbose 1)
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote "/ssh:")
                     "tramp-direct-async-process" t))
  (setq tramp-chunksize 500)
  ;;(setq tramp-chunksize nil)
  (setq tramp-inline-compress-start-size 1000000) ;; Enable compression above 1MB
  ;;(setq tramp-copy-size-limit 1000000) ;; Use compression for copying above 1MB
  (defun js-vc-off-if-remote ()
    (if (file-remote-p (buffer-file-name))
        (setq-local vc-handled-backends nil)))
  ;;(add-hook 'find-file-hook 'js-vc-off-if-remote)

  (connection-local-set-profile-variables
   'remote-direct-async-process
   '((tramp-direct-async-process . t)))


  (connection-local-set-profiles
   '(:application tramp :machine "jannesauvala-ubuntu-dev-vm")
   'remote-direct-async-process)
  )

(use-package async
  :init (dired-async-mode 1))

(provide 'init-tramp)
