;;; init-bishbr-dired.el --- my dired stuff

;;; Commentary:
;;


(use-package dired-hacks-utils
  :commands dired
  )

(use-package casual-dired
  :ensure t
  :bind (:map dired-mode-map ("<f2>" . #'casual-dired-tmenu)))



(provide 'init-bishbr-dired)

;;; init-bishbr-dired.el ends here
