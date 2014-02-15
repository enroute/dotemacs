;;; jdee, for java
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/jdee/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/elib"))
(require 'cedet)
(require 'jde)

(provide '11jde)