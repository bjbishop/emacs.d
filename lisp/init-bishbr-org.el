;;; init-bishbr-org.el --- My org setup

;;; Commentary:
;;


(setq
 org-agenda-files '("~/Documents/org/tasks.org")
 org-directory "~/Documents/org"
 org-default-notes-file "~/Documents/org/notes.org"
 org-agenda-include-diary t
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
  :config
  (setq consult-denote-grep-command 'consult-ripgrep)
  :bind
  ("<f7>" . consult-denote-grep)
  )



(provide 'init-bishbr-org)

;;; init-bishbr-org.el ends here
