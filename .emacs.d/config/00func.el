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
        (dolist (tmp (list i (+ 32 i) (+ 64 i) (+ 96 i) ;; (+ 128 i) (+ 160 i) (+ 192 i) (+ 224 i)
                           ))
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


(provide '00func)