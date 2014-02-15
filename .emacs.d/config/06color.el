(cond ((> emacs-major-version 23)	; emacs 24 has `load-theme', see `customize-themes'
       (load-theme 'tango t))
      (t				; otherwise, use `color-theme'
       (color-theme-initialize)
       (color-theme-montz)))

(provide '06color)
