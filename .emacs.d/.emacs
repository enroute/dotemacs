(winner-mode 1)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/packages/")
(require 'xcscope)
(require 'unicad)
(require 'smart-operator)

(require 'ido)


(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'c-mode-hook (lambda ()
  (smart-operator-mode)
  (c-set-style "linux")
  (setq c-basic-offset 4)))
  
(global-set-key "\M-w" 'clipboard-kill-ring-save)