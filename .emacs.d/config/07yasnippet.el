;; do not use the original snippets
;; (setq yas/root-directory
;;       (list yas/root-directory
;; 	    (expand-file-name "~/.emacs.d/yasnippet-snippets")))
(setq yas/root-directory (expand-file-name "~/.emacs.d/yasnippet-snippets"))

(when (featurep 'yasnippet)
  (require 'yasnippet)
  (yas/global-mode 1)
  (yas/reload-all))

(provide '07yasnippet)
