(require 'dired-x)

;;;###autoload
(defun my-dired-w3m-visit ()
  (interactive)
  (let ((file (dired-get-filename nil t)))
    (w3m-goto-url (concat "file://" file))))
     
;; dired-mode-map key-bindings
(add-hook 'dired-mode-hook (lambda ()
  ;; Omit hidden files
  (setq dired-omit-files (concat dired-omit-files "\\|^\\..*$"))
  (dired-omit-mode t)
  ;;; W -> use emacs-w3m to browse the file of current line
  (when (featurep 'w3m)
    (define-key dired-mode-map (kbd "W") 'my-browse-with-emacs-w3m))))

(defun my-browse-with-emacs-w3m ()
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (when (featurep 'w3m)
      (w3m-browse-url file))))

;; Toggle showing dot files.
;; Use `dired-omit-files' and `dired-omit-extensions' in `dired-omit-mode' instead.
;; (defun dired-dotfiles-toggle ()
;;   "Show/hide dot-files"
;;   (interactive)
;;   (when (equal major-mode 'dired-mode)
;;     (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
;;         (progn 
;;           (set (make-local-variable 'dired-dotfiles-show-p) nil)
;;           (message "h")
;;           (dired-mark-files-regexp "^\\\.")
;;           (dired-do-kill-lines))
;;       (progn (revert-buffer) ; otherwise just revert to re-show
;;              (set (make-local-variable 'dired-dotfiles-show-p) t)))))

;; 
