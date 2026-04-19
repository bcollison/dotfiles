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

(setq config-file (concat user-emacs-directory "rewrite-configuration-from-scratch.org"))
;; (setq config-file (concat user-emacs-directory "no-config.org"))
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
 '(lsp-java-completion-lazy-resolve-text-edit-enabled nil)
 '(lsp-java-import-gradle-java-home "/Users/brian.collison/.jenv/versions/17.0/")
 '(lsp-java-java-path "/Users/brian.collison/.jenv/versions/17.0/bin/java")
 '(nnreddit-log-rpc t)
 '(nnreddit-python-command "python3.8")
 '(org-agenda-block-separator 61)
 '(org-agenda-files
   '("~/Documents/org/sprints/2021.13.org" "~/documents/org/gcal/personal.org"
     "~/documents/org/gcal/work.org" "~/documents/org/index.org"
     "~/documents/org/events.org" "~/documents/org/habits.org"
     "~/documents/org/recurring-events.org" "~/documents/org/work.org"
     "~/documents/org/home.org"
     "/Users/brian.collison/Documents/org/.org-gcal/raken.org"
     "/Users/brian.collison/Dropbox/Apps/MobileOrg/mobile-inbox.org"
     "/Users/brian.collison/Dropbox/Apps/MobileOrg/raken-inbox.org"
     "/Users/brian.collison/Dropbox/Apps/MobileOrg/vonnegut-inbox.org"
     "/Users/brian.collison/Dropbox/Apps/MobileOrg/inbox.org"))
 '(org-agenda-loop-over-headlines-in-active-region nil)
 '(org-agenda-start-with-log-mode t)
 '(org-jira-done-states '("Closed" "Resolved" "Done" "Deployed"))
 '(org-jira-use-status-as-todo t)
 '(org-plantuml-args '("-headless"))
 '(org-plantuml-executable-path "plantuml")
 '(org-plantuml-jar-path "/Users/brian.collison/plantuml.jar")
 '(org-timeblock-inbox-file
   "/Users/brian.collison/Dropbox/Apps/MobileOrg/raken-inbox.org")
 '(org-timeblock-scale-options '(8 . 22))
 '(package-selected-packages
   '(actionscript actionscript-mode activities all-the-icons-dired auto-compile
		  bufler code-review dap-mode dired-collapse dired-rainbow
		  dired-ranger dired-single docker doom-modeline edit-server
		  ement es-mode esup exercism flycheck flycheck-plantuml
		  gnu-elpa-keyring-update go-mode google-this gptel groovy-mode
		  helm-lsp ivy-rich jq-mode logview lsp-actionscript lsp-java
		  lua-mode marginalia mastodon nnreddit ob-restclient orderless
		  org-appear org-gcal org-jira org-roam-protocol org-roam-server
		  org-timeblock org-tree-slide ox-slack perspective
		  plantuml-mode pomm popper quelpa-use-package restclient
		  restclient-jq rubik sicp slack slime
		  use-package-ensure-system-package vertico vterm xkcd yasnippet
		  yasnippet-snippets zenburn-theme))
 '(plantuml-default-exec-mode 'jar)
 '(plantuml-executable-args '("-headless" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(plantuml-jar-args '("-charset" "UTF-8" "-DPLANTUML_LIMIT_SIZE=18192"))
 '(plantuml-jar-path "/Users/brian.collison/plantuml.jar")
 '(plantuml-java-args
   '("-Djava.awt.headless=true" "-jar" "--illegal-access=deny"
     "-DPLANTUML_LIMIT_SIZE=18192"))
 '(tab-bar-new-tab-choice "*scratch*")
 '(tab-bar-select-tab-modifiers '(super))
 '(warning-suppress-log-types '((comp) (emacs) (emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs) (emacs)))
 '(ynab-base-url "https://api.ynab.com")
 '(ynab-debug t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
