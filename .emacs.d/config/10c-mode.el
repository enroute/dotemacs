(add-hook 'c-mode-hook (lambda ()
  (smart-operator-mode)
  (setq indent-tabs-mode nil)		; disable tabs
  (c-set-style "linux")
  (setq c-basic-offset 4)
  ))

(provide '10c-mode)