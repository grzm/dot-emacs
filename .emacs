(prefer-coding-system 'utf-8) ; Use UTF-8

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(require 'cl) ;; besides being Lisp, provides labels and defvar, used below

(defvar emacs-root (expand-file-name "~/.emacs.d/")
  "Libraries kept in ~/.emacs.d, my home emacs directory.")

(labels ((add-path (p)
           (add-to-list 'load-path
                        (concat emacs-root p))))
	(add-path "elisp") ;; personal elisp code and config
	(add-path "misc") ;; directory for single-file elisp
	)
(defvar elisp-root (concat emacs-root "elisp/")
  "Directory which contains my Emacs customizations")
(defvar aquamacs-p (boundp 'aquamacs-version))
(if aquamacs-p
  (setq custom-file (concat elisp-root "customizations-aquamacs.el"))
  (setq custom-file (concat elisp-root "customizations.el")))
(load custom-file)

(load-library "grzm-config") ; personal keybindings and functions
(load-library "paredit-config")
(load-library "php-config")
(load-library "yasnippet-config")
(load-library "markdown-config")
(load-library "clojure-config")
