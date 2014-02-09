;;;; Global settings

(winner-mode 1)                         ; enable winner mode
(column-number-mode t)                  ; column number
(auto-fill-mode t)                      ; auto fill

(menu-bar-mode -1)                      ; disable menu bar
(toggle-scroll-bar -1)                  ; disable scroll bar
(tool-bar-mode -1)                      ; disable tool bar

(setq indent-tabs-mode nil)             ; disable tabs

(require 'xcscope)			; for viewing c codes

(require 'unicad)			; charset auto detector
(require 'smart-operator)		; smart operator when programming

(require 'ido)
(require 'ibuffer)

(defalias 'yes-or-no-p 'y-or-n-p)

;;; backup files
(setq backup-directory-alist '(("."	.	"~/tmp/emacs-backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;;; Make `kill-line' with no arg at beg of line kill the whole line.
(setq kill-whole-line t)

(provide '02global)