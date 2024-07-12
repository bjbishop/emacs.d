;;; init-preload-local.el --- My cosmetic settings

;;; Commentary:
;;

;;; Code:

(modify-all-frames-parameters '((width . 142)
                                (height . 43)
                                (left . 0)
                                (right . 0)
                                (internal-border-width . 1)
                                (vertical-scroll-bars . nil)
                                (tool-bar-lines . 0)
                                ;; (font . "SauceCodePro NF:pixelsize=15:weight=semi-bold:slant=normal:width=normal:spacing=100:scalbable=true")
                                (font . "SauceCodePro Nerd Font Mono:pixelsize=18:weight=medium:slant=normal:width=normal:spacing=100:scalable=true")
                                ))


;; Don't resize the frame just because the
;; font changed:
(setq frame-inhibit-implied-resize t)

(provide 'init-preload-local)

;;; init-preload-local.el ends here
