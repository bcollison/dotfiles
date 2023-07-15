;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Ensure that use-package is installed.
;;
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package before loading the literate configuration.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq config-file (concat user-emacs-directory "configuration.org"))
(org-babel-load-file config-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-save-mode t)
 '(ement-room-left-margin-width 12)
 '(ement-room-sender-headers nil)
 '(ement-save-sessions t)
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(es-cc-endpoint "http://localhost:9201/")
 '(gnus-select-method '(nnreddit ""))
 '(org-agenda-files
   '("~/Documents/org/sprints/2021.13.org" "~/documents/org/gcal/personal.org" "~/documents/org/gcal/work.org" "~/documents/org/index.org" "~/documents/org/events.org" "~/documents/org/habits.org" "~/documents/org/recurring-events.org" "~/documents/org/work.org" "~/documents/org/home.org" "/Users/brian.collison/Documents/org/.org-gcal/raken.org"))
 '(org-jira-done-states '("Closed" "Resolved" "Done" "Deployed"))
 '(org-jira-use-status-as-todo t)
 '(org-plantuml-args '("-headless"))
 '(org-plantuml-executable-path "plantuml")
 '(org-plantuml-jar-path "/Users/brian.collison/plantuml.jar")
 '(package-selected-packages
   '(gptel exercism zenburn-theme sicp slime rubik quelpa-use-package mastodon yasnippet-snippets yasnippet ement vterm restclient-jq jq-mode ob-restclient restclient logview groovy-mode es-mode pomm org-tree-slide orderless marginalia vertico gnu-elpa-keyring-update popper flycheck-plantuml plantuml-mode xkcd esup perspective actionscript-mode actionscript lsp-actionscript helm-lsp lsp-java dap-mode flycheck nnreddit docker dired-collapse dired-ranger dired-single dired-rainbow all-the-icons-dired bufler edit-server org-gcal org-jira org-appear org-roam-protocol org-roam-server go-mode slack doom-modeline ivy-rich auto-compile use-package-ensure-system-package))
 '(plantuml-default-exec-mode 'jar)
 '(plantuml-executable-args '("-headless" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(plantuml-jar-args '("-charset" "UTF-8" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(plantuml-jar-path "/Users/brian.collison/plantuml.jar")
 '(plantuml-java-args
   '("-Djava.awt.headless=true" "-jar" "--illegal-access=deny" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(tab-bar-new-tab-choice "*scratch*")
 '(tab-bar-select-tab-modifiers '(super))
 '(warning-suppress-log-types '((comp) (emacs) (emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
