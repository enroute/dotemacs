(cond ((> emacs-major-version 23)       ; emacs 24 has `load-theme', see `customize-themes'
       (load-theme 'tango t))
      (t
       (require 'color-theme)
       (when (featurep 'color-theme)    ; otherwise, use `color-theme'
         (color-theme-initialize)
         (color-theme-montz))))
