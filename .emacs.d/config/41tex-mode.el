(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; To enable LaTeX Math mode by default
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
