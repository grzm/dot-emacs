(defconst emacs-start-time (current-time))

(unless noninteractive
  (message "Loading %s..." load-file-name))

(package-initialize nil)

(require 'org)

(org-babel-load-file (expand-file-name "common-config.org" user-emacs-directory))

(setq viasat-emacs-directory "~/.emacs.viasat.d/")

(let ((grzm-org (expand-file-name "grzm.org" user-emacs-directory))
      (viasat-org (expand-file-name "viasat.org" viasat-emacs-directory)))
  (org-babel-load-file (if (file-exists-p viasat-org) viasat-org grzm-org)))

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
