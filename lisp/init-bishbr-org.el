;;; init-bishbr-org.el --- My org setup

;;; Commentary:
;;


(setq
 org-agenda-files '("~/Docs/org/tasks.org")
 org-directory "~/Docs/org/"
 org-default-notes-file "~/Docs/org/notes.org"
 org-agenda-include-diary t
 org-use-speed-commands t
 )

(use-package deft
  :commands deft
  :bind ("<f8>" . deft)
  :init
  (setq deft-default-extension "org")
  :custom
  (deft-directory "/Users/bishbr/src/deft/")
  (deft-default-extension "org")
  (deft-use-filename-as-title nil)
  (deft-use-filter-string-for-filename t)
  (deft-recursive t)
  )

(use-package denote
  :init
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
  :commands (denote denote-date denote-create-note)

  :custom
  (denote-directory "~/src/deft")
  )

(use-package consult-denote
  :init
  (setq consult-denote-grep-command 'consult-ripgrep)
  :bind
  ("<f7>" . consult-denote-grep)
  :init
  (consult-denote-mode t)
  )



(provide 'init-bishbr-org)

;;; init-bishbr-org.el ends here
