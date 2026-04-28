(custom-set-variables
 '(org-jira-done-states '("Closed" "Resolved" "Done" "Deployed"))
 '(org-jira-use-status-as-todo t)
 '(org-plantuml-args '("-headless"))
 '(org-plantuml-executable-path "plantuml")
 '(plantuml-executable-args '("-headless" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(plantuml-jar-args '("-charset" "UTF-8" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(plantuml-java-args
   '("-Djava.awt.headless=true" "-jar" "--illegal-access=deny"
     "-DPLANTUML_LIMIT_SIZE=18192"))
 '(tab-bar-new-tab-choice "*scratch*")
 '(tab-bar-select-tab-modifiers '(super))
 '(warning-suppress-log-types '((comp) (emacs) (emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs) (emacs))))
