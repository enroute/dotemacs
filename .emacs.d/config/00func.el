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
    (let ((i     0)
          (tmp   0)
          (rows 32))
      (insert (propertize
               "                                           [ASCII table]\n\n"
               'face font-lock-comment-face))
      (insert (propertize
               (concat "DEC [0X] [BINARY]  SYM | DEC [0X] [BINARY]  SYM | DEC [0X] [BINARY]  SYM | DEC [0X] [BINARY]  SYM\n"
                       "-----------------------+------------------------+------------------------+-----------------------\n")
               'face font-lock-comment-face))
      (while (< i rows)
        (dolist (tmp (list i (+ rows i) (+ rows rows i) (+ rows rows rows i)))
          (insert (concat
                   (propertize (format "%3d " tmp)
                               'face font-lock-function-name-face)
                   (propertize (format "[%2x] " tmp)
                               'face font-lock-constant-face)
                   (propertize (my-number-to-binary-string tmp 8)
                               'face font-lock-constant-face)
                   "  "
                   (propertize (format "%3s" (single-key-description tmp))
                               'face font-lock-string-face)
                   (unless (= tmp (+ rows rows rows i))
                     ;(propertize " | " 'face font-lock-variable-name-face)))))
                     (propertize " | " 'face font-lock-comment-face)))))
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


;; sdcv at point
(defun sdcv ()
  (interactive)
  (let ((word (if (and (mark) (region-active-p))
                  (buffer-substring-no-properties (region-beginning) (regine-end))
                (current-word t t))))
    (when (not word)
      (setq word (read-string "Enter word to translate: ")))
    (shell-command (concat "sdcv" " " word))))

(defun my-number-to-binary-string (i &optional len)
  "convert an integer into it's binary representation in string format"
  (let ((res ""))
    (while (not (= i 0))
      (setq res (concat (if (= 1 (logand i 1)) "1" "0") res))
      (setq i (lsh i -1)))
    (if (string= res "")
        (setq res "0"))
    (if (and (numberp len) (> len (length res)))
        (setq res (concat (make-string (- len (length res)) ?0) res)))
    res))