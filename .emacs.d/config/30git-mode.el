(add-to-list 'load-path "~/.emacs.d/packages/magit/lisp")
(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/packages/magit/Documentation/"))
