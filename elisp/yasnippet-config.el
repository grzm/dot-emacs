(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat emacs-root "yasnippet/snippets"))
;; (let ((my-snippets-directory (concat emacs-root "yasnippet/snippets")))
;;      (progn
;;        (setq yas/root-directory
;;              (if (stringp yas/root-directory)
;;                  (list my-snippets-directory yas/root-directory)
;;                (append (list my-snippets-directory) yas/root-directory)))
;;        (mapc 'yas/load-directory yas/root-directory)))
(setq yas/indent-line 'fixed)
