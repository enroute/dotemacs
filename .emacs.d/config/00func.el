;;; Codes stolen from the internet w/o modification
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun ascii-table-show ()
  "Print the ascii table"
  (interactive)
  (with-current-buffer (switch-to-buffer "*ASCII table*")
    (erase-buffer)
    (let ((i   0)
          (tmp 0))
      (insert (propertize
               "                     [ASCII table]\n\n"
               'face font-lock-comment-face))
      (insert (propertize
	       (concat "DEC [0X]  SYM | DEC [0X]  SYM | DEC [0X]  SYM | DEC [0X]  SYM\n"
		       "--------------+---------------+---------------+--------------\n")
	       'face font-lock-comment-face))
      (while (< i 32)
        (dolist (tmp (list i (+ 32 i) (+ 64 i) (+ 96 i)))
          (insert (concat
                   (propertize (format "%3d " tmp)
                               'face font-lock-function-name-face)
                   (propertize (format "[%2x]" tmp)
                               'face font-lock-constant-face)
                   "  "
                   (propertize (format "%3s" (single-key-description tmp))
                               'face font-lock-string-face)
                   (unless (= tmp (+ 96 i))
                     (propertize " | " 'face font-lock-variable-name-face)))))
        (newline)
        (setq i (+ i 1)))
      (beginning-of-buffer))
    (local-set-key "q" 'kill-this-buffer)
    (toggle-read-only 1)
    (message "Press q to quit.")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; run shell command and return command output
(defun my-get-shell-command-output (command)
  "Return, rather then show it in a buffer, the output of shell command
COMMAND."
  (interactive "sCommand:")
  (save-excursion
    (let ((temp-buffer "*Temp Shell Command Output*"))
      (shell-command command temp-buffer)
      (set-buffer temp-buffer)
      ;; store the result in a local variable
      (let ((output (split-string
                     (buffer-substring-no-properties
                      (point-min) (point-max)))))
        (kill-buffer temp-buffer)
        ;; return the output as a list
        output))))


(provide '00func)
