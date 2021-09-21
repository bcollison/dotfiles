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
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(gnus-select-method '(nnreddit ""))
 '(org-agenda-files
   '("~/Documents/org/sprints/2021.13.org" "~/documents/org/gcal/personal.org" "~/documents/org/gcal/work.org" "~/documents/org/index.org" "~/documents/org/events.org" "~/documents/org/habits.org" "~/documents/org/recurring-events.org" "~/documents/org/work.org" "~/documents/org/home.org" "/Users/brian.collison/Documents/org/.org-gcal/raken.org"))
 '(package-selected-packages
   '(popper flycheck-plantuml plantuml-mode xkcd esup perspective actionscript-mode actionscript lsp-actionscript helm-lsp lsp-java dap-mode flycheck nnreddit docker dired-collapse dired-ranger dired-single dired-rainbow all-the-icons-dired bufler edit-server org-gcal org-jira org-appear org-roam-protocol org-roam-server go-mode slack doom-modeline ivy-rich auto-compile use-package-ensure-system-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
