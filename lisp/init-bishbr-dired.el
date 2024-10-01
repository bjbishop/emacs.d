;;; init-bishbr-dired.el --- my dired stuff

;;; Commentary:
;;


(use-package dired-hacks-utils
  :commands dired
  )

(use-package casual-dired
  :ensure t
  :bind (:map dired-mode-map ("<f2>" . #'casual-dired-tmenu)))

(defun my/dired-du ()
  "Run 'du -hc' on the directory under the cursor in Dired."
  (interactive)
  (let ((current-dir (dired-get-file-for-visit)))
    (if (file-directory-p current-dir)
        (dired-do-async-shell-command "du -hc" nil (list current-dir))
      (message "The current point is not a directory."))))

(provide 'init-bishbr-dired)

;;; init-bishbr-dired.el ends here
