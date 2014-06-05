(require 'org)
(require 'remember)

(setq org-log-done 'time)
(setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(setq org-agenda-files (list "~/org/work.org" "~/org/personal.org"))

(add-hook 'org-mode-hook (lambda ()
  ;(define-key org-mode-map "\C-ca" 'org-agenda)
  (define-key org-mode-map "\C-cl" 'org-store-link)))