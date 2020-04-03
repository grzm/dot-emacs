;; ready, set, go!
(defconst emacs-start-time (current-time))

(unless noninteractive
  (message "Loading %s..." load-file-name))


;; make sure we have use-package installed
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; load the meat of it
(require 'org)

(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

(setq viasat-emacs-directory "~/.emacs.viasat.d/")

(let ((grzm-dot-org (expand-file-name "grzm.org" user-emacs-directory))
      (viasat-dot-org (expand-file-name "README.org" viasat-emacs-directory)))
  (org-babel-load-file (if (file-exists-p viasat-dot-org) viasat-dot-org grzm-dot-org)))


;; how long did this all take us?
(when window-system
  (let ((elapsed (float-time (time-subtract (current-time)
                                            emacs-start-time))))
    (message "Loading %s...done (%.3fs)" load-file-name elapsed))

  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed (float-time (time-subtract (current-time)
                                                         emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed )))
            t))
