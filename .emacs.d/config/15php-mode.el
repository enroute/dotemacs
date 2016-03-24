(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/php-mode-master"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/php-mode-master/skeleton"))
(require 'php-mode)
(eval-after-load 'php-mode
  '(require 'php-ext))
