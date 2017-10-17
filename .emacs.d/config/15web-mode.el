(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun rem (pxs)
  "Return the corresponding rem of px"

  (interactive "sInput series of px: ")
  (save-excursion
    (let ((numbers (split-string pxs " ")))
      (dolist (px numbers)
        (progn
          ;(setq px (/ (* (string-to-number px) 320) 760.0 16.0))
          (setq px (/ (string-to-number px) 75.0))
          ;(message "%f" px)
          (insert-before-markers (format "%f" px) "rem ")))
      (delete-backward-char 1)
      (insert-before-markers ";"))))