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
  :bind ("C-c H" . deadgrep)
  )

(global-set-key (kbd "C-c h") 'sanityinc/consult-ripgrep-at-point )

(use-package embark
  :bind (
         ("C-." . embark-act)       ;; pick some comfortable binding
         ("C-h B" . embark-bindings) ;; alternative for `describe-bindings'
         ("C-;" . embark-dwim)
         )
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  )

(use-package embark-consult)


(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(add-hook 'minibuffer-setup-hook #'vertico-repeat-save)
(global-set-key "\M-R" #'vertico-repeat)


(use-package consult
  :bind
  ("C-c b r" . consult-recent-file)
  ("M-g o" . consult-outline)
  ("M-g m" . consult-mark)
  ("M-g k" . consult-global-mark)
  ("M-g i" . consult-imenu)
  ("M-s l" . consult-line)
  )




(use-package cape
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p i" . cape-ispell)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p \\" . cape-tex)
         ("C-c p _" . cape-tex)
         ("C-c p ^" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )





(use-package copilot
  :load-path "/Users/bishbr/src/emacs/copilot.el"
  :custom
  (copilot-node-executable "/opt/homebrew/bin/node")
  (copilot-indent-offset-warning-disable t)
  :config
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  (define-key copilot-mode-map (kbd "M-C-N") #'copilot-next-completion)
  (define-key copilot-mode-map (kbd "M-C-P") #'copilot-previous-completion)
  (define-key copilot-mode-map (kbd "M-C-<right>") #'copilot-accept-completion-by-word)
  (define-key copilot-mode-map (kbd "M-C-<down>") #'copilot-accept-completion-by-line)
  (define-key copilot-mode-map (kbd "C-g") #'copilot-clear-overlay)
  (global-copilot-mode -1)
  )

(use-package phrases
  :load-path "/Users/bishbr/tsk/emacs_lisp_phrases"
  )



(require 'init-bishbr-cosmetic)
(require 'init-bishbr-git)
(require 'init-bishbr-org)

(provide 'init-local)

;;; init-local.el ends here
