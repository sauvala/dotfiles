;;;; init-macos.el -*- lexical-binding: t; -*- no-byte-compile: t -*-

(when (featurep 'ns)
  (customize-set-variable 'ns-command-modi***REMOVED***er 'meta)
  (customize-set-variable 'ns-right-option-modi***REMOVED***er nil)
  (customize-set-variable 'ns-option-modi***REMOVED***er 'super)
  (customize-set-variable 'ns-function-modi***REMOVED***er 'hyper))

(provide 'init-macos)
