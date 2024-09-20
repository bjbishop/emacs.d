;;; init-bishbr-project.el --- project stuff

;;; Commentary:
;;


(defun project-vterm ()
  (interactive)
  (defvar vterm-buffer-name)
  (let* ((default-directory (project-root     (project-current t)))
         (vterm-buffer-name (project-prefixed-buffer-name "vterm"))
         (vterm-buffer (get-buffer vterm-buffer-name)))
    (if (and vterm-buffer (not current-prefix-arg))
        (pop-to-buffer vterm-buffer  (bound-and-true-p display-comint-buffer-action))
      (vterm))))



(use-package project
  :bind
  ("C-x p v" . project-vterm)
  ("C-x p m" . magit-status)
  ("C-x p g" . consult-ripgrep)
  :custom
  (project-switch-commands
   '((project-find-file "File" nil)
     (project-find-dir "Dir" nil)
     (project-vterm "vterm" "v")
     (project-dired "Dired" nil)
     (consult-ripgrep "Rg" "g")
     (project-vc-dir "VC" "c")
     (project-execute-extended-command "eXt" "x")
     ))
  )

(use-package consult-project-extra)
(use-package otpp
  :config
  (otpp-mode t)
  )


(provide 'init-bishbr-project)

;;; init-bishbr-project.el ends here
