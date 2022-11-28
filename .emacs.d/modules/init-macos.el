;;;; init-macos.el -*- lexical-binding: t; -*-

(when (feature 'ns)
  (customize-set-variable mac-right-option-modi***REMOVED***er nil)
  (customize-set-variable mac-command-modi***REMOVED***er 'super)
  (customize-set-variable ns-function-modi***REMOVED***er 'hyper)
  (customize-set-variable x-select-enable-clipboard t))

(provide 'init-macos)
