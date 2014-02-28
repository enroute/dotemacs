;;;; Global settings

(setq default-major-mode 'text-mode)    ; set default major mode

(winner-mode 1)                         ; enable winner mode
(column-number-mode t)                  ; column number

(setq fill-column 80)                   ; default to 70
(auto-fill-mode t)                      ; auto fill

(menu-bar-mode -1)                      ; disable menu bar
(toggle-scroll-bar -1)                  ; disable scroll bar
(tool-bar-mode -1)                      ; disable tool bar

(require 'w3m)                          ; w3m for browsing WWW and HTML files
(when (featurep 'w3m)
  (setq w3m-use-cookies t)		; use cookies
  (add-hook 'w3m-mode-hook (lambda ()
    (local-unset-key "\C-xb"))))        ; don't use `w3m-switch-buffer'

(require 'xcscope)                      ; for viewing c codes

(require 'unicad)                       ; charset auto detector
(require 'smart-operator)               ; smart operator when programming

;; ido mode
(require 'ido nil t)
(when (featurep 'ido)
  (ido-mode t)                          ; turn on ido mode
  (setq ido-create-new-buffer 'always)  ; always create new buffer
  (run-at-time "30 minutes" 1800 'ido-save-history)
  (setq ido-save-directory-list-file (expand-file-name "~/.emacs.d/.ido_last")))

;; recentf mode
(require 'recentf)
(when (featurep 'recentf)
  (recentf-mode 1)
  (setq recentf-save-file (expand-file-name "~/.emacs.d/.recentf"))
  (setq recentf-exclude (append recentf-exclude
                                '(".recentf"
                                  ".ido_last"
                                  "emacs-woman-cache.el")))
  (setq recentf-max-menu-items 100)
  (run-at-time "30 minutes" 1800 'recentf-save-list))

;; ibuffer
(require 'ibuffer)

;; identify buffer name by prefix directory
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(defalias 'yes-or-no-p 'y-or-n-p)       ; just y-or-n

(show-paren-mode t)                     ; show match parens

;;; backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup/"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

(setq-default inhibit-startup-message t) ; inhibits the startup screen
(setq-default indent-tabs-mode nil)	 ; disable tabs
(setq kill-whole-line t)   ; Make `kill-line' also kill the newline char
(setq kill-ring-max 200)   ; default to 60

;; show time on mode line
(setq display-time-format "[%Z]%Y-%m-%d[%a]%H:%M")
(display-time-mode 1)
