;;; init-bishbr-cosmetic.el --- Cosmetic related packages and settings

;;; Commentary:
;;

;;; Code:



(use-package windmove
  :bind (
         ("A-n" . windmove-left)
         ("A-h" . windmove-right)
         ("A-i" . windmove-down)
         ("A-r" . windmove-up)
         ("s-n" . windmove-left)
         ("s-h" . windmove-right)
         ("s-i" . windmove-down)
         ("s-r" . windmove-up)
         ("C-A-n" . 'shrink-window-horizontally)
         ("C-A-h" . 'enlarge-window-horizontally)
         ("C-A-r" . 'enlarge-window)
         ("C-A-i" . 'shrink-window)
         ("C-A-+" . 'balance-windows)
         )
  :custom
  (windmove-wrap-around nil)
  )


(use-package doom-themes)
(use-package catppuccin-theme)

;; 'frappe, 'latte, 'macchiato, 'mocha

;; Don't zoom text with the mouse or trackpad
(global-set-key (kbd "<pinch>") 'ignore)
(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light
     (load-theme 'doom-one-light)
     ;; (setq catppuccin-flavor 'latte)
     ;; (catppuccin-reload)

     (add-to-list 'default-frame-alist '(ns-appearance . light))
     (add-to-list 'frameset-filter-alist '(ns-transparent-titlebar . :never))
     (modify-all-frames-parameters '(
                                     (ns-appearance . light)
                                     ))
     )
    ('dark
     (load-theme 'doom-winter-is-coming-dark-blue)

     (add-to-list 'default-frame-alist '(ns-appearance . dark))
     (add-to-list 'frameset-filter-alist '(ns-transparent-titlebar . :never))
     (modify-all-frames-parameters '(
                                     (ns-appearance . dark)
                                     ))
     )))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)
(my/apply-theme 'light)

(defun light ()
  "Activate a light color theme."
  (interactive)
  (my/apply-theme 'light))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (my/apply-theme 'dark)
  )

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

(use-package indent-bars
  :disabled
  :hook ((python-mode yaml-mode) . indent-bars-mode)
  )

(provide 'init-bishbr-cosmetic)

;;; init-bishbr-cosmetic.el ends here
