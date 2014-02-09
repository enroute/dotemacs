(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-xk" 'kill-this-buffer)

;;; make \C-k, <deleteline> kill a whole line
(setq kill-whole-line t)


(provide '03key)