;;; Compiled snippets and support files for `jenkinsfile-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'jenkinsfile-mode
                     '(("pipeline" "pipeline {\n    agent any\n\n    environment {\n        KEY = \"value\"\n    }\n\n    stages {\n        stage(\"Example\") {\n            when {\n                branch \"main\"\n            }\n            steps {\n                sh \"\"\"\\\n                  uptime\n                  \"\"\"\n            } // steps\n            post {\n                cleanup {\n                    deleteDir()\n                }\n            }\n        } // stage\n    } // stages\n\n} // pipeline\n" "pipeline" nil nil nil "/Users/bishbr/.emacs.d/snippets/jenkinsfile-mode/pipeline" nil nil)))


;;; Do not edit! File generated at Tue Oct 15 14:15:21 2024
