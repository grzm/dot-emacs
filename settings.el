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
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p 2)
 '(magit-diff-refine-hunk (quote all))
 '(org-agenda-custom-commands
   (quote
    (("d" "D24C Task view" agenda ""
      ((org-agenda-overriding-header "")
       (org-agenda-start-on-weekday nil)
       (org-agenda-start-day "-3d")
       (org-agenda-prefix-format "  - %(org-d24c-prefix)")
       (org-agenda-span
        (quote 10))
       (org-agenda-sorting-strategy
        (quote
         (priority-down category-up tag-down)))
       (org-agenda-show-all-dates nil)
       (org-agenda-todo-keyword-format ""))
      ("~/work/dept24c/work.txt"))
     ("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-show-all-dates t)
 '(org-default-notes-file "~/Documents/gtd/inbox.org")
 '(org-duration-format (quote h:mm))
 '(org-startup-folded nil)
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
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (org excorporate f cider org-trello polymode go-mode ox-reveal magit org-projectile org-re-reveal transient dockerfile-mode docker-compose-mode sesman yaml-mode ripgrep projectile-ripgrep goto-last-change csv-mode dash-functional dot-mode org-bullets org-clubhouse quelpa-use-package projectile harvest timesheet let-alist inf-clojure markdown-mode markdown-preview-mode column-marker autopair solarized-theme which-key use-package typopunct typo sass-mode rainbow-delimiters php-mode graphviz-dot-mode gh-md clojure-mode-extra-font-locking)))
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
