;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Ensure that use-package is installed.
;;
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package before loading the literate configuration.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Dropbox/Apps/MobileOrg/standups.org" "~/Dropbox/Apps/MobileOrg/home.org" "~/Dropbox/Apps/MobileOrg/vgi.org" "~/Dropbox/Apps/MobileOrg/index.org")))
 '(org-capture-templates
   (quote
    (("b" "Blog idea" entry
      (file "~/documents/notes/blog-ideas.org")
      "* %?
")
     ("e" "Email" entry
      (file+headline org-index-file "Inbox")
      "* TODO %?

%a

")
     ("f" "Finished book" table-line
      (file "~/documents/notes/books-read.org")
      "| %^{Title} | %^{Author} | %u |")
     ("r" "Reading" checkitem
      (file
       (org-file-path "to-read.org")))
     ("s" "Subscribe to an RSS feed" plain
      (file "~/documents/rss/urls")
      "%^{Feed URL} \"~%^{Feed name}\"")
     ("t" "Todo" entry
      (file+headline org-index-file "Inbox")
      "* TODO %?
"))) t)
 '(package-selected-packages
   (quote
    (org-mime org-jira org-journal yard-mode yaml-mode which-key wgrep web-mode use-package synosaurus solarized-theme smex slim-mode scss-mode scala-mode sbt-mode ruby-end rspec-mode rainbow-delimiters python-mode py-autopep8 proof-general projectile-rails paredit org-bullets multi-term minions less-css-mode instapaper helpful haskell-mode haml-mode graphviz-dot-mode go-errcheck gnuplot forge flycheck-package flx evil-surround evil-org evil-mu4e evil-magit engine-mode elpy dumb-jump dired-open dired-hide-dotfiles diff-hl deft counsel company-jedi company-go company-coq coffee-mode chruby auto-compile ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Inconsolata" :height 70))))
 '(markdown-code-face ((t nil)))
 '(variable-pitch ((t (:family "Libre Baskerville" :height 70 :weight thin)))))
