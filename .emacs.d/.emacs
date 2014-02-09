(add-to-list 'load-path (expand-file-name "~/.emacs.d/config/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/"))

(require '00func)      ; useful functions
(require '01putty)     ; settings for putty
(require '02global)    ; global settings
(require '03key)       ; gloabl key settings
(require '04eim)       ; emacs input method by ywb@newsmth(happierbee)
(require '10c-mode)    ; settings for c-mode
