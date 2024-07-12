;;; init-local.el --- My local init stuff

;;; Commentary:
;;

;;; Code:


(setq custom-enabled-themes '(whiteboard))
(use-package auto-virtualenvwrapper
  )

(setq use-package-always-ensure t)
(setq use-package-verbose nil)

(require 'init-bishbr-cosmetic)

(provide 'init-local)

;;; init-local.el ends here
