;; bound n & p to open next/previous image
(define-key image-mode-map (kbd "n") 'my-next-file)
(define-key image-mode-map (kbd "p") 'my-prev-file)

(defun my-next-file ()
  (my-open-file 1))

(defun my-prev-file ()
  (my-open-file -1))

(defun my-open-file (step)
  ;; TODO:
  )