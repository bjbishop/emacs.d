;;; init-bishbr-term.el --- my terminal stuff

;;; Commentary:
;;



(require 'term)
(defun jnm/term-toggle-mode ()
  "Toggle term between line mode and char mode."
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(define-key term-mode-map (kbd "C-c C-j") 'jnm/term-toggle-mode)

(eval-after-load "term"
  '(progn
     (term-set-escape-char ?\C-c)
     (define-key term-raw-map (kbd "C-c") nil)
     (define-key term-raw-map (kbd "C-c C-j") 'jnm/term-toggle-mode)
     )
  )






(add-to-list 'load-path "~/src/emacs-libvterm")
(let (vterm-install)
  (require 'vterm))

(define-key vterm-mode-map (kbd "<f7>") nil)
(define-key vterm-mode-map (kbd "<f8>") nil)
(define-key vterm-mode-map (kbd "<f9>") nil)
(define-key vterm-mode-map (kbd "<f12>") nil)
(define-key vterm-mode-map (kbd "M-`") nil)

(defvar vterm-pwd "")
(make-variable-buffer-local 'vterm-pwd)
(defvar vterm-cmd "")
(make-variable-buffer-local 'vterm-cmd)

(setq
 vterm-kill-buffer-on-exit t
 vterm-shell "/opt/homebrew/bin/zsh -li"
 vterm-max-scrollback 20000
 )

(defun vterm-set-title-hook (title)
  "TITLE = user@host@lastcmd:path  or user@host:path."
  (let* ((tokens (split-string title ":" ))
         dir)
    (when (equal 2 (length tokens))
      (setq vterm-pwd (string-trim-left (nth 1 tokens)))
      (setq tokens (split-string (nth 0 tokens) "@" ))
      (when (>  (length tokens) 1)
        (setq vterm-user (nth 0 tokens))
        (setq vterm-host (nth 1 tokens))
        (when (and (nth 2 tokens)
                   (not (string-empty-p (or (nth 2 tokens) ""))))
          (setq vterm-cmd (nth 2 tokens))))
      (setq dir
            (file-name-as-directory
             (if (and (string= vterm-host (system-name))
                      (string= vterm-user (user-real-login-name)))
                 (expand-file-name vterm-pwd)
               (concat "/-:" vterm-user "@" vterm-host ":"
                       vterm-pwd))))
      (when (ignore-errors (file-directory-p dir))
        (cd-absolute dir))
      ;; (message "pwd=%s,user=%s,host=%s,cmd=%s d=%s"
      ;;          vterm-pwd vterm-user vterm-host vterm-cmd dir)
      (rename-buffer (format "term %s %s@%s:%s" vterm-cmd vterm-user vterm-host vterm-pwd ) t)
      )))

(add-hook 'vterm-mode-hook
          (lambda ()
            (setq-local global-hl-line-mode nil)
            (setq-local line-number-mode nil)
            (setq-local column-number-mode nil)
            )
          )

(add-hook 'vterm-set-title-functions 'vterm-set-title-hook)
(add-hook 'term-mode-hook
          (defun my-term-mode-hook ()
            (setq bidi-paragraph-direction 'left-to-right))
          )
(use-package multi-vterm
  :bind (
         ("C-M-'" . multi-vterm)
         ("C-'" . multi-vterm-next)
         ("<f12>" . multi-vterm-dedicated-toggle)
         )
  )





















(provide 'init-bishbr-term)

;;; init-bishbr-term.el ends here
