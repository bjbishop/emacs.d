;;; init-local.el --- My local init stuff

;;; Commentary:
;;

;;; Code:

;; (dimmer-mode -1)
(setq custom-enabled-themes '(whiteboard))
(use-package auto-virtualenvwrapper
  )
(use-package request)

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
(setenv "GNUPGHOME" "~/src/stow/gnupg")
(setenv "GPG_TTY" "/dev/ttys000")
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
 display-time-default-load-average nil
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
(bind-key "C-c b u" 'revert-buffer)
(bind-key "C-c w" 'whitespace-cleanup)

(midnight-mode t)
(desktop-save-mode -1)


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



(use-package copilot-chat
  :load-path "/Users/bishbr/src/emacs/copilot-chat.el")

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

(use-package indent-guide)

(use-package phrases
  :load-path "/Users/bishbr/tsk/emacs_lisp_phrases"
  )

(use-package groovy-mode
  :diminish
  :custom
  (groovysh "/opt/homebrew/bin/groovysh")
  )

(use-package bats-mode
  :mode "\\.bats\\'"
  )

(use-package jenkinsfile-mode
  :mode ("\\Jenkinsfile\\'" . jenkinsfile-mode)
  )


;;https://github.com/john2x/jenkinsfile-mode/issues/1#issuecomment-644597436

(flycheck-define-checker jenkinsfile
  "A Jenkins declarative pipeline syntax checker using the Jenkins declarative linter.
  See URL `https://www.jenkins.io/doc/book/pipeline/development/#linter'."
  :command ("ssh" "-p" "2022" "-i" "~/.ssh/bishbr@PEARSONML-91R5Q05-rsa" "admin@localhost" "declarative-linter")
  :standard-input t
  :error-patterns
  ((error line-start "WorkflowScript: " line ": " (message) " @ line " line ", column " column "." line-end))
  :modes (jenkinsfile-mode groovy-mode))


(use-package writegood-mode)
(use-package wgrep-deadgrep)

(use-package smart-region
  :bind ("C-@" . er/expand-region)
  )

(use-package yafolding
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yafolding-mode)
  (add-hook 'yaml-mode-hook 'yafolding-mode)
  (add-hook 'json-mode-hook 'yafolding-mode)
  )

(use-package multiple-cursors
  :bind (
         ("C-S-c C-S-c" . mc/edit-lines)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         )
  :config
  (multiple-cursors-mode 1)
  )

(use-package move-text
  :bind (
         ("M-<up>" .  move-text-up)
         ("M-<down>" . move-text-down)
         )
  )

(use-package volatile-highlights
  :defer t
  :blackout t
  :config
  (volatile-highlights-mode t)
  )

(use-package hydra
  :defer 2
  :config
  (require 'hydra-examples)
  (key-chord-define-global ",."
                           (defhydra hydra-splitter (global-map "C-M-s"
                                                                :pre (progn
                                                                       (global-hl-line-mode 1)
                                                                       (blink-cursor-start)
                                                                       )
                                                                :post (global-hl-line-mode -1))
                             ("1" delete-other-windows)
                             ("n" hydra-move-splitter-left)
                             ("i" hydra-move-splitter-down)
                             ("h" hydra-move-splitter-right)
                             ("r" hydra-move-splitter-up)
                             ("b" balance-windows "bal")
                             ("s" swap-buffers "swp")
                             ("A-n" windmove-left)
                             ("A-i" windmove-down)
                             ("A-h" windmove-right)
                             ("A-r" windmove-up)
                             ("0" ace-delete-window "del")
                             ("+" text-scale-increase "in")
                             ("-" text-scale-decrease "out")
                             ("m" (ace-window 4) "mov")
                             ("o" rotate-window "rotwin")
                             ("l" rotate-layout "rotlay")
                             ("v" (lambda ()
                                    (interactive)
                                    (split-window-right)
                                    (windmove-right)
                                    )
                              "vert")
                             ("x" (lambda ()
                                    (interactive)
                                    (split-window-below)
                                    (windmove-down)
                                    )
                              "horz")
                             )
                           )
  )

(use-package easysession
  :diminish
  :config
  (easysession-save-mode t)
  )

(use-package lin
  ;; How to add it to specific modes
  ;; :config
  ;; (setq lin-mode-hooks
  ;;       '(bongo-mode-hook
  ;;         dired-mode-hook
  ;;         elfeed-search-mode-hook
  ;;         git-rebase-mode-hook
  ;;         grep-mode-hook
  ;;         ibuffer-mode-hook
  ;;         ilist-mode-hook
  ;;         ledger-report-mode-hook
  ;;         log-view-mode-hook
  ;;         magit-log-mode-hook
  ;;         mu4e-headers-mode-hook
  ;;         notmuch-search-mode-hook
  ;;         notmuch-tree-mode-hook
  ;;         occur-mode-hook
  ;;         org-agenda-mode-hook
  ;;         pdf-outline-buffer-mode-hook
  ;;         proced-mode-hook
  ;;         tabulated-list-mode-hook))
  )


(require 'init-bishbr-cosmetic)
(require 'init-bishbr-git)
(require 'init-bishbr-org)
(require 'init-bishbr-dired)
(require 'init-bishbr-term)
(require 'init-bishbr-project)


(provide 'init-local)

;;; init-local.el ends here
