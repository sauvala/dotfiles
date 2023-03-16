;;;; init-media.el -*- lexical-binding: t; no-byte-compile: t; -*-

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))

(require 'quelpa-use-package)

(use-package empv
  :quelpa (empv
           :fetcher github
           :repo "isamert/empv.el"))

(provide 'init-media)
