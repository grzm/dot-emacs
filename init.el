(defconst emacs-start-time (current-time))

(unless noninteractive
  (message "Loading %s..." load-file-name))

(package-initialize nil)

(require 'org)
(org-babel-load-file (expand-file-name "grzm.org" user-emacs-directory))

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
