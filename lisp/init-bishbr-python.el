;;; init-bishbr-python.el --- My python configuration

;;; Commentary:
;;

;;; Code:

(use-package py-vterm-interaction
  ;; :load-path "~/proj/emacs/py-vterm-interaction.el"
  :hook (python-mode . py-vterm-interaction-mode)
  :config
  ;; (setq-default py-vterm-interaction-repl-program "ipython -i")
;;; Suggested:
  ;; (setq-default py-vterm-interaction-repl-program "ipython3 --no-banner --simple-prompt --quiet")
  (setq-default py-vterm-interaction-repl-program "ipython3")
  (setq-default py-vterm-interaction-silent-cells t)
  )



(provide 'init-bishbr-python)

;;; init-bishbr-python.el ends here
