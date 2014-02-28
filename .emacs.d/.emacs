(add-to-list 'load-path (expand-file-name "~/.emacs.d/config/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/"))

;; load all files
;; (mapc 'load (directory-files "~/.emacs.d/config" t "^[^.#].*\.el$"))

;; load each file separately, which makes it convenient to disable one
;; temparately
(load "00func")      ; useful functions

;; output of "env | grep 'SSH_CLIENT'" should looks like:
;; SSH_CLIENT=xxx.xxx.xxx.xxx xxx 22
(when (member "SSH_CLIENT" (my-get-shell-command-output "env | grep 'SSH_CLIENT'"))
  (load "01putty"))  ; settings for putty

(load "02global")    ; global settings
(load "03key")       ; gloabl key settings
(load "04eim")       ; emacs input method by ywb@newsmth(happierbee")
(load "05dired")     ; dired
(load "06color")     ; color theme settings
(load "07yasnippet") ; yasnippet settings
(load "10c-mode")    ; settings for c-mode
(load "11jde")       ; settings for jde