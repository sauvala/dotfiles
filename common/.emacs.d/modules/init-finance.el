;;;; init-finance.el -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package ledger-mode)

(use-package csv2ledger
  :commands csv2ledger
  :custom
  ;(c2l-csv-columns '(date _ description _ amount _ _ _)) ; for bank norwegian
  (c2l-csv-columns '(date amount description)) ; for s-pankki
  )

;; Ledger Recurring Transactions 
(use-package dklrt)

(provide 'init-finance)
