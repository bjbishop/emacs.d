;;; init-local.el --- My local init stuff

;;; Commentary:
;;

;;; Code:


(setq custom-enabled-themes '(whiteboard))
(use-package auto-virtualenvwrapper
  )

(setq use-package-always-ensure t)
(setq use-package-verbose nil)

(use-package use-package-chords
  :config
  (key-chord-mode 1)
  (key-chord-define-global "xb" 'ibuffer)
  )

(setenv "LSP_USE_PLISTS" "true")
(setenv "SVDIR" "/opt/homebrew/var/service")
(setenv "RUNIT_DIR" "/opt/homebrew/var/service")
(fset 'yes-or-no-p 'y-or-n-p)

(setq
 calendar-latitude 41.920507
 calendar-longitude -91.423098
 initial-scratch-message ""
 kill-whole-line t
 view-read-only t
 wdired-allow-to-change-permissions t
 wdired-create-parent-directories t
 locate-command "fd"
 locate-update-path nil
 locate-update-command nil
 tramp-verbose 0
 mac-option-modifier 'alt
 mac-command-modifier 'meta
 mac-function-modifier 'hyper
 clean-buffer-list-delay-general 1
 )

(setq recentf-exclude (append '(
                                "/sudo:"
                                "/docker:"
                                "COMMIT_EDITMSG"
                                )
                              recentf-exclude)
      )

(setq tramp-ssh-controlmaster-options
      (concat
       "-o ControlPath=/Users/bishbr/.ssh/%%r@%%h:%%p "
       "-o ControlMaster=auto -o ControlPersist=yes"))


(bind-key "C-c b f" 'browse-url-at-point)
(midnight-mode t)
(use-package simple-modeline
  :demand t
  :config
  (simple-modeline-mode 1)
  )



(use-package flymake-shellcheck
  :hook (sh-mode . flymake-shellcheck-load)
  )

(use-package editorconfig
  :diminish
  :config
  (editorconfig-mode 1)
  )

(use-package crux)

(use-package pinentry
  :demand t
  :config
  (pinentry-start)
  )

(use-package ace-window
  :commands (ace-window)
  )

(use-package ace-jump-mode
  :chords (
           ("vb" . ace-jump-word-mode)
           ("yg" . ace-jump-line-mode)
           )
  :bind (
         ("A-a" . ace-jump-char-mode)
         )
  )

(use-package prism
  :commands (prism-mode prism-whitespace-mode)
  )
(use-package deadgrep
  :bind ("C-c h" . deadgrep)
  )


(require 'init-bishbr-cosmetic)

(provide 'init-local)

;;; init-local.el ends here
