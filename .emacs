(prefer-coding-system 'utf-8) ; Use UTF-8

(require 'cl) ;; besides being Lisp, provides labels and defvar, used below

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))

(defvar emacs-root (expand-file-name "~/emacs/")
  "Libraries kept in ~/emacs, my home emacs directory.")

(labels ((add-path (p)
           (add-to-list 'load-path
                        (concat emacs-root p))))
	;;(add-path "mmm-mode")
	(add-path "elisp") ;; personal elisp code and config
	(add-path "misc") ;; directory for single-file elisp
;;	(add-path "yasnippet") ;; Yet Another Snippet
	)

(defvar aquamacs-p (string-match "Aquamacs" (version)))
;;(when aquamacs-p
;;  (load-library "aquamacs-config"))

(load-library "grzm-config") ; personal keybindings and functions
;; (load-library "mmm-mode-config")
;;(load-library "pgsql-config")
;;(load-library "ctags-config")
;;(load-library "ruby-config")
;;(load-library "org-mode-config")
;;(load-library "graphviz-dot-mode")
;;(load-library "paredit-config")
;;(load-library "yasnippet-config")
;;(load-library "backup-config")





