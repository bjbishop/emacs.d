;;; init-bishbr-cosmetic.el --- Cosmetic related packages and settings

;;; Commentary:
;;

;;; Code:

(use-package catppuccin-theme
  :ensure t
  )

;; 'frappe, 'latte, 'macchiato, 'mocha
(setq catppuccin-flavor 'latte)
(catppuccin-reload)

;; Don't zoom text with the mouse or trackpad
(global-set-key (kbd "<pinch>") 'ignore)
(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)

;;doom-oksolar-light) ;;kaolin-breeze) ;;flexoki-themes-light) ;; solarized-selenized-light)

;; (defun my/apply-theme (appearance)
;;   "Load theme, taking current system APPEARANCE into consideration."
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (pcase appearance
;;     ('light

;;      ;; (load-theme 'kaolin-mono-light)

;;      (setq catppuccin-flavor 'latte)
;;      (catppuccin-reload)

;;      (add-to-list 'default-frame-alist '(ns-appearance . light))
;;      (add-to-list 'frameset-filter-alist '(ns-transparent-titlebar . :never))
;;      (modify-all-frames-parameters '(
;;                                      (ns-appearance . light)
;;                                      ))
;;      )
;;     ('dark

;;      ;; (load-theme 'doom-oceanic-next)

;;      (setq catppuccin-flavor 'frappe)
;;      (catppuccin-reload)

;;      (add-to-list 'default-frame-alist '(ns-appearance . dark))
;;      (add-to-list 'frameset-filter-alist '(ns-transparent-titlebar . :never))
;;      (modify-all-frames-parameters '(
;;                                      (ns-appearance . dark)
;;                                      ))
;;      )))

;; (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)
;; (my/apply-theme 'light)

;; https://karthinks.com/software/batteries-included-with-emacs/
(defun pulse-line (&rest _)
  "Pulse the current line."
  _(pulse-momentary-highlight-one-line (point)))

(dolist (command '(scroll-up-command
                   scroll-down-command
                   recenter-top-bottom
                   other-window
                   switch-window
                   windmove-left
                   windmove-right
                   windmove-down
                   windmove-up))
  (advice-add command :after #'pulse-line))

(if (string-match "GNU Emacs 29" (emacs-version))
    (pixel-scroll-precision-mode -1)
  )

(provide 'init-bishbr-cosmetic)

;;; init-bishbr-cosmetic.el ends here
