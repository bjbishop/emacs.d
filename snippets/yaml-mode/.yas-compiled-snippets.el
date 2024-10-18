;;; Compiled snippets and support files for `yaml-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'yaml-mode
                     '(("!trovu" "$0 1:\n  url: `(substring-no-properties (current-kill 0 t))` + <query>\n  title: Search ${1}\n  description: Search for a keyword on ${1}\n  tags:\n    - tag\n  examples:\n    - arguments: ${2}\n      description: Search for \"${2}\" on ${1}\n" "trovu" nil nil
                        ((yas-indent-line 'fixed)
                         (yas-wrap-around-region 'nil))
                        "/Users/bishbr/.emacs.d/snippets/yaml-mode/trovu" nil nil)))


;;; Do not edit! File generated at Tue Oct 15 14:15:21 2024
