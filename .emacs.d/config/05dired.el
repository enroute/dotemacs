(require 'dired-x)

;;;###autoload
(defun my-dired-w3m-visit ()
  (interactive)
  (let ((file (dired-get-filename nil t)))
    (w3m-goto-url (concat "file://" file))))
     

(provide '05dired)