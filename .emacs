(prefer-coding-system 'utf-8) ; Use UTF-8

;;; 2010-12-05
;;; I should rewrite this command to install ELPA and my ELPA
;;; dependencies if it's not already installed.
;;; What would be involved with this?

(require 'cl) ;; besides being Lisp, provides labels and defvar, used below

(defvar emacs-root (expand-file-name "~/.emacs.d/")
  "Libraries kept in ~/.emacs.d, my home emacs directory.")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(labels ((add-path (p)
           (add-to-list 'load-path
                        (concat emacs-root p))))
	(add-path "elisp") ;; personal elisp code and config
	(add-path "misc") ;; directory for single-file elisp
        (add-path "packages")
        (add-path "elpa")
        (add-path "org/lisp")
        (add-path "org/contrib/lisp")
	)
(defvar elisp-root (concat emacs-root "elisp/")
  "Directory which contains my Emacs customizations")

(defvar aquamacs-p (boundp 'aquamacs-version))
;(if aquamacs-p
;  (setq custom-file (concat elisp-root "customizations-aquamacs.el"))
;  (setq custom-file (concat elisp-root "customizations.el")))
;(load custom-file)

(load-library "grzm-config") ; personal keybindings and functions
(load-library "paredit-config")
(load-library "php-config")
(load-library "ruby-config")
;(load-library "phpunit-config")
(load-library "yasnippet-config")
(load-library "markdown-config")
(load-library "clojure-config")
(load-library "autopair-config")
;; (load-library "erlang-config")
(load-library "org-config")
(load-library "js-config")
(load-library "recentf-config")

(put 'upcase-region 'disabled nil)
