;;; init-bishbr-git.el --- git stuff from my old config

;;; Commentary:
;;


;; ;; I just removed this from init-github.el
;; (when (package-installed-p 'forge)
;;   (package-delete (car (cdr (assoc 'forge package-alist)))))

(use-package vc-msg
  :bind ("C-x v p" . vc-msg-show)
  :init
  (setq
   vc-msg-copy-id-to-kill-ring nil
   vc-msg-show-at-line-beginning-p nil
   vc-msg-newbie-friendly-msg nil
   )
  )

(use-package magit-delta
  :disabled
  :after magit
  :blackout
  :hook ((magit-mode . magit-delta-mode))
  )

;; (use-package git-blamed
;;   :commands (git-blamed-mode)
;;   )

(use-package browse-at-remote
  :bind (
         ("C-c b b" . browse-at-remote)
         ("C-c b k" . browse-at-remote-kill)
         )
  :config
  (add-to-list 'browse-at-remote-remote-type-regexps
               `(:host ,(rx bol "gilligan.pearsondev.com" eol)
                       :type "gitlab"
                       ))
  (add-to-list 'browse-at-remote-remote-type-regexps
               `(:host ,(rx bol "work.gitlab.com" eol)
                       :type "gitlab"
                       :actual-host "gitlab.com"
                       ))
  (add-to-list 'browse-at-remote-remote-type-regexps
               `(:host ,(rx bol "bitbucket.pearson.com" eol)
                       :type "bitbucket"
                       ))

  )

(use-package blamer
  :bind (("C-c b i" . blamer-show-posframe-commit-info))
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  (blamer--overlay-popup-position 'smart)
  (blamer-force-truncate-long-line nil)
  (blamer-max-commit-message-length 70)
  (blamer-show-avatar-p nil)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                   :background "unspecified"
                   :height 140
                   :italic t)))
  :config
  (global-blamer-mode -1))


(provide 'init-bishbr-git)

;;; init-bishbr-git.el ends here
