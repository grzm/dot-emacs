;; Just enough to get started.
;; Lars Tveito's Emacs config is very helpful! https://github.com/larstvei/dot-emacs

;; Tangling requires org.
(require 'org)

;; Find the *real* configuration.
(find-file (concat user-emacs-directory "init.org"))

;; Tangle it.
(org-babel-tangle)

;; Load it.
(load-file (concat user-emacs-directory "init.el"))
