(add-to-list 'load-path (expand-file-name "~/.emacs.d/config/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/"))

;; load all files
;; (mapc 'load (directory-files "~/.emacs.d/config" t "^[^.#].*\.el$"))

;; load each file separately, which makes it convenient to disable one
;; temparately
(require '00func)      ; useful functions

(when (member "1" (my-get-shell-command-output "env | grep -q 'SSH_CLIENT'"))
  (require '01putty))  ; settings for putty

(require '02global)    ; global settings
(require '03key)       ; gloabl key settings
(require '04eim)       ; emacs input method by ywb@newsmth(happierbee)
(require '05dired)     ; dired
(require '06color)     ; color theme settings
(require '07yasnippet) ; yasnippet settings
(require '10c-mode)    ; settings for c-mode
