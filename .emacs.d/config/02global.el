;;;; Global settings

(winner-mode 1)                         ; enable winner mode
(column-number-mode t)                  ; column number

(setq fill-column 80)			; default to 70
(auto-fill-mode t)                      ; auto fill

(menu-bar-mode -1)                      ; disable menu bar
(toggle-scroll-bar -1)                  ; disable scroll bar
(tool-bar-mode -1)                      ; disable tool bar

(setq indent-tabs-mode nil)             ; disable tabs

(require 'xcscope)			; for viewing c codes

(require 'unicad)			; charset auto detector
(require 'smart-operator)		; smart operator when programming

(require 'ido nil t)
(when (featurep 'ido)
  (ido-mode t)				; turn on ido mode
  (setq ido-save-directory-list-file (expand-file-name "~/.emacs.d/.ido_last")))

(require 'ibuffer)

(defalias 'yes-or-no-p 'y-or-n-p)	; just y-or-n

(show-paren-mode t)			; show match parens

;;; backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup/"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

(setq kill-whole-line t) ; Make `kill-line' also kill the newline char
(setq kill-ring-max 200) ; default to 60

(provide '02global)