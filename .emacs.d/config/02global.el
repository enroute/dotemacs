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
  (setq w3m-use-cookies t)              ; use cookies
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; THIS NOT WORK IN 24.5.1 on Ubuntu 16.04 LTS \n \l ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defadvice show-paren-function (after show-matching-paren-offscreen activate)
;;   "If the matching paren is offscreen, show the matching line in the
;; echo area. Has no effect if the character before point is not of
;; the syntax class ')'."
;;   (interactive)
;;   (let ((matching-text nil))
;;     ;; Only call `blink-matching-open' if the character before point
;;     ;; is a close parentheses type character. Otherwise, there's not
;;     ;; really any point, and `blink-matching-open' would just echo
;;     ;; "Mismatched parentheses", which gets really annoying.
;;     (if (char-equal (char-syntax (char-before (point))) ?\))
;;         (setq matching-text (blink-matching-open)))
;;     (if (not (null matching-text))
;;         (message matching-text))))

;;; backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup/"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

(setq-default inhibit-startup-message t) ; inhibits the startup screen
(setq-default indent-tabs-mode nil)      ; disable tabs
(setq kill-whole-line t)   ; Make `kill-line' also kill the newline char
(setq kill-ring-max 200)   ; default to 60

;; show time on mode line
(setq display-time-format "[%Z]%Y-%m-%d[%a]%H:%M")
(display-time-mode 1)

;; enable all disabled commands
(setq disabled-command-function nil)
;; or enable disabled features one by one
;; (put 'set-goal-column 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'downcase-region 'disabled nil)
;; (put 'scroll-left 'disabled nil)
;; (put 'erase-buffer 'disabled nil)

;; enter view mode when buffer is read-only
(setq view-read-only t)

;; no final new line
(setq mode-require-final-newline nil)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Split the windows horizontally instead of vertically, which makes it much easier to follow the changes.
(setq ediff-split-window-function 'split-window-horizontally)

;; add left & right margin
(add-hook 'window-configuration-change-hook
          (lambda ()
            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 1 1)))
