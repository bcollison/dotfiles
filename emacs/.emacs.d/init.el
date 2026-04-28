;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; but I thought org moved to elpa?
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
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
;; Custom file strategy:
;;   custom-shared.el          — committed; settings common to all machines
;;   custom-{user-login-name}.el — committed; per-machine settings; Emacs writes here
;;
;; Workflow: use M-x customize freely — changes land in the machine file.
;; To share a setting across machines, move it to custom-shared.el manually.
(setq custom-file (concat "~/.emacs.d/custom-" (user-login-name) ".el"))
(dolist (f (list "~/.emacs.d/custom-shared.el" custom-file))
  (when (file-exists-p f)
    (load-file f)))
(let ((sc "~/.emacs.d/my-productivity/shutdown-capture.el")
      (md "~/.emacs.d/my-productivity/morning-dashboard.el"))
  (when (file-exists-p sc) (load sc))
  (when (file-exists-p md) (load md)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(package-vc-selected-packages
   '((org-timeblock :url "https://github.com/bcollison/org-timeblock" :branch
                    "merge-gleek-show-done"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
