;;; jdee, for java
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/jdee/lisp"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/cogre"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/contrib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/ede"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/eieio"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/semantic"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/speedbar"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/srecode"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/elib"))

(require 'cedet)
(require 'jde)

(setq semantic-load-turn-useful-things-on t)

;; Disable version check. Current version of jdee supports only lower
;; version of cedet
(setq jde-check-version-flag nil)

;; for obsolete functions in emacs 24
(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

(provide '11jde)
