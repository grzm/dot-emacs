(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-sources
   (quote
    ("~/.authinfo" "~/.authinfo.gpg" "~/.netrc" macos-keychain-internet macos-keychain-internet)))
 '(cljr-assume-language-context (quote clj))
 '(cljr-clojure-test-declaration "[clojure.test :as test :refer [are deftest is]]")
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p 2)
 '(magit-diff-refine-hunk (quote all))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("" "questions for marcel" tags-todo "@marcel" nil))))
 '(org-agenda-files
   (quote
    ("~/Documents/gtd/gtd.org" "~/Documents/gtd/inbox.org" "~/client-work/hims/todo.org")))
 '(org-capture-templates
   (quote
    (("t" "Todo [inbox]" entry
      (file+headline "~/Documents/gtd/inbox.org" "Inbox")
      "* TODO %i%?")
     ("d" "Todo [dept24c]" entry
      (file "~/Documents/dept24c/todo.org")
      "* TODO %i%?")
     ("h" "Todo [hims]" entry
      (file+headline "~/client-work/hims/todo.org" "Inbox")
      "* TODO %i%?"))))
 '(org-default-notes-file "~/Documents/gtd/inbox.org")
 '(org-duration-format (quote h:mm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 3))))
 '(org-startup-indented t)
 '(org-tag-alist
   (quote
    (("@marcel" . 109)
     ("q" . 113)
     ("automower" . 97)
     ("postgresql" . 112)
     ("emacs" . 101))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "STARTED(s)" "NEXT(n)" "APPT(a)" "WAITING(w)" "SOMEDAY(p)" "|" "DONE(d)" "CANCELLED(c)" "DEFERRED(f)"))))
 '(package-selected-packages
   (quote
    (clojure-mode sesman yaml-mode ripgrep projectile-ripgrep goto-last-change csv-mode dash-functional cider dot-mode org-bullets org-clubhouse quelpa-use-package projectile harvest timesheet let-alist inf-clojure markdown-mode markdown-preview-mode clj-refactor column-marker magit autopair solarized-theme which-key use-package typopunct typo sass-mode rainbow-delimiters php-mode graphviz-dot-mode gh-md clojure-mode-extra-font-locking)))
 '(safe-local-variable-values
   (quote
    ((cider-clojure-cli-global-options . "-A:dev -J-Dlogback.configurationFile=logback-dev.xml")
     (cider-clojure-cli-global-options . "-A:dev:backfiller:nucleate:deploy -J-Dlogback.configurationFile=logback-dev.xml")
     (eval define-clojure-indent
           (metrics/log-time
            (quote defun)))
     (eval define-clojure-indent
           (perseverance/retriable
            (quote defun)))
     (cider-clojure-cli-global-options . "-A:dev:nucleate:deploy")
     (cider-boot-parameters . "deps -A test -A bench -A repl javac repl -s -H :: wait")
     (cider-boot-parameters . "deps -A listener -A repl local repl -s -H :: wait")
     (cider-clojure-cli-global-options . "-A:dev:rebl")
     (cider-clojure-cli-global-options . "-A:dev")
     (cider-boot-parameters . "deps -A:test repl -s -H :: wait")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16"))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#859900"))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#268bd2"))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#b58900")))))
