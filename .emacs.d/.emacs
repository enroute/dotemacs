
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/config/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/"))

;; load all files
;; (mapc 'load (directory-files "~/.emacs.d/config" t "^[^.#].*\.el$"))

(load "000private")

;; load each file separately, which makes it convenient to disable one
;; temporarily
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
(load "12lua-mode")  ; lua mode
(load "13cperl-mode"); cperl-mode
(load "14org-mode")  ; org-mode
(load "15web-mode")  ; web-mode

(if (> emacs-major-version 23) ; emacs 23 has problem in with cl-lib in loading php-mode
    (load "15php-mode"))  ; php-mode

;; When done, show the home directory
(dired (expand-file-name "~/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/work.org")))
 '(package-selected-packages (quote (magit jdee ztree dash)))
 '(safe-local-variable-values
   (quote
    ((org-src-preserve-indentation)
     (eval and
           (featurep
            (quote ox-extra))
           (ox-extras-activate
            (quote
             (ignore-headlines))))
     (eval require
           (quote ox-texinfo+)
           nil t)
     (eval require
           (quote ox-extra)
           nil t)
     (eval require
           (quote org-man)
           nil t)
     (eval require
           (quote magit-utils)
           nil t)
     (bug-reference-bug-regexp . "#\\(?2:[0-9]+\\)")
     (TeX-PDF-mode . t)
     (TeX-master . "master")
     (eval progn
           (c-set-offset
            (quote innamespace)
            (quote 0))
           (c-set-offset
            (quote inline-open)
            (quote 0)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
