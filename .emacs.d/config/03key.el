(global-set-key "\M-w" 'clipboard-kill-ring-save) ; make M-w also save to clipboard
(global-set-key "\C-xk" 'kill-this-buffer)        ; kill current buffer rather than asking
(global-set-key "\C-ca" 'org-agenda)

;;; for [RIGHT ALT] in putty
;; map ALTGR to ALT, the reg file:

;; This is NOT tested.
;; [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
;; "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,38,e0,5d,e0,38,00,38,e0,\
;;   00,00,00,00

;; This works.
;; # right alt in putty
;; # capslock as ctrl
;; [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
;; "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,1d,00,3a,00,38,00,38,e0,00,00,00,00

;;; for [RIGHT ALT] in console, ref: http://www.joshstaiger.org/archives/2005/04/fixing_the_righ.html
;; 1. Save current keymap. Note: dumpkeys doesn't work in eshell, so do it on a real terminal.
;;     dumpkeys > mykmap
;;     cp mykmap origin.keymap
;; 2. Capture [RIGHT ALT] keycode using showkey. Let's assume it's 100.
;; 3. Edit mykmap, find the corresponding line:
;;     keycode 100 = AltGr
;; Change it to
;;     keycode 100 = Alt
;; If the next line (or one of the next lines) is:
;;     alt keycode 100 = Compose
;; Remove it.
;; 4. Load new keymap:
;;     loadkeys mykmap
;; 5. Make the changes permanent (e.g. add the last command to ~/.bashrc)
