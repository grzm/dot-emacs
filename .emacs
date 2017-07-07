(prefer-coding-system 'utf-8) ; Use UTF-8

;;; 2010-12-05
;;; I should rewrite this command to install ELPA and my ELPA
;;; dependencies if it's not already installed.
;;; What would be involved with this?

(require 'cl) ;; besides being Lisp, provides labels and defvar, used below

(defvar emacs-root (expand-file-name "~/.emacs.d/")
  "Libraries kept in ~/.emacs.d, my home emacs directory.")

(require 'package)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;(setq package-enable-at-startup nil)
;;(setq package-load-list '(magit))
(package-initialize)

(labels ((add-path (p)
           (add-to-list 'load-path
                        (concat emacs-root p))))
	(add-path "elisp") ;; personal elisp code and config
	(add-path "misc") ;; directory for single-file elisp
        (add-path "packages")
        (add-path "elpa")
        (add-path "org/lisp")
        (add-path "org/contrib/lisp"))

(defvar elisp-root (concat emacs-root "elisp/")
  "Directory which contains my Emacs customizations")

(load-library "grzm-config") ; personal keybindings and functions

(load-library "autopair-config")
(load-library "cider-config")
(load-library "clojure-config")
(load-library "js-config")
(load-library "magit-config")
(load-library "markdown-config")
(load-library "org-config")
(load-library "paredit-config")
(load-library "php-config")
(load-library "pollen-config")
(load-library "recentf-config")
(load-library "ruby-config")
(load-library "server-config")
(load-library "show-paren-config")
(load-library "solarized-config")
(load-library "typo-config")
(load-library "yasnippet-config")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p 2)
 '(package-selected-packages
   (quote
    (column-marker cider magit autopair solarized-theme which-key use-package typopunct typo sass-mode rainbow-delimiters php-mode graphviz-dot-mode gh-md clojure-mode-extra-font-locking))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-library "auto-save-config")
