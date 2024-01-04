;;;; init-macos.el -*- lexical-binding: t; no-byte-compile: t; -*-

(when (featurep 'ns)
  (customize-set-variable 'ns-command-modifier 'super)
  (customize-set-variable 'ns-right-option-modifier nil)
  (customize-set-variable 'ns-option-modifier 'meta)
  (customize-set-variable 'ns-function-modifier 'hyper))

(when (featurep 'mac)
  (customize-set-variable 'mac-option-modifier 'meta)
  (customize-set-variable 'mac-function-modifier '(:button 2))
  (mac-auto-operator-composition-mode +1))

(provide 'init-macos)
