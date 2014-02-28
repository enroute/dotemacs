(require 'dired-x)

;;;###autoload
(defun my-dired-w3m-visit ()
  (interactive)
  (let ((file (dired-get-filename nil t)))
    (w3m-goto-url (concat "file://" file))))
     
;; dired-mode-map key-bindings
(add-hook 'dired-mode-hook (lambda ()
  ;;; W -> use emacs-w3m to browse the file of current line
  (when (featurep 'w3m)
    (define-key dired-mode-map (kbd "W") 'my-browse-with-emacs-w3m))))

(defun my-browse-with-emacs-w3m ()
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (when (featurep 'w3m)
      (w3m-browse-url file))))
