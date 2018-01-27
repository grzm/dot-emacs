(defconst emacs-start-time (current-time))

(unless noninteractive
  (message "Loading %s..." load-file-name))

(setq
 package-enable-at-startup nil
 package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                    ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

(require 'cl) ;; besides being Lisp, provides labels and defvar, used below

(eval-and-compile
  (mapc #'(lambda (path)
            (add-to-list 'load-path
                         (expand-file-name path user-emacs-directory)))
        '("elisp" "misc" "packages" "elpa")))

(prefer-coding-system 'utf-8)

(defsubst hook-into-modes (func &rest modes)
  (dolist (mode-hook modes) (add-hook mode-hook func)))

(load-library "grzm-config") ; personal keybindings and functions

(use-package autopair :defer t)

(use-package cider
  :defer t
  :config
  (setq cider-prompt-save-file-on-load nil
        cider-eval-result-prefix " ;; => "
        cider-font-lock-dynamically '(macro core function var)
        cider-repl-pop-to-buffer-on-connect 'display-only))

(use-package clj-refactor
  :defer t
  :bind ("/" . cljr-slash))

(use-package clojure-mode
  :defer t
  :config
  (setq clojure-indent-style :align-arguments
        clojure-align-forms-automatically t)
  (defun my-clojure-mode-hook ()
    (paredit-mode +1)
    (put-clojure-indent 'defui '(1 nil nil (1)))
    (rainbow-delimiters-mode)
    ;; (clj-refactor-mode 1)
    (cljr-add-keybindings-with-prefix "C-c C-m"))
  (add-hook 'clojure-mode-hook 'my-clojure-mode-hook))

(load-library "emacs-lisp-mode-config")

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package inf-clojure
  :defer t
  :config (setq inf-clojure-program "/Users/grzm/homebrew/bin/planck"))

(use-package ido
  :demand t
  :config
  (setq ido-enable-flex-matching t
        ido-create-new-buffer 'always)
  (ido-mode 1))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :mode (("\\`README\\.markdown\\'" . gfm-mode)
         ("\\`README\\.md\\'" . gfm-mode)
         ("\\`CHANGELOG\\.md\\'" . gfm-mode)
         ("\\`CHANGELOG\\.markdown\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (setq markdown-command "/Users/grzm/homebrew/bin/multimarkdown"

        markdown-css-paths
        '("https://cdn.rawgit.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css")

        markdown-fontify-code-blocks-natively t))

(use-package markdown-preview-mode
  :after solarized-theme
  :defer t
  :config
  (setq markdown-preview-stylesheets
        '("https://cdn.rawgit.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css"
          "https://cdn.rawgit.com/isagalaev/highlight.js/master/src/styles/solarized-light.css")))

;;(load-library "org-config")

(use-package paredit-mode
  :defer t
  :config
  (defun check-region-parens ()
    "Check if parentheses in the region are balanced. Signals a
scan-error if not."
    (interactive)
    (save-restriction
      (save-excursion
        (let ((deactivate-mark nil))
          (condition-case c
              (progn
                (narrow-to-region (region-beginning) (region-end))
                (goto-char (point-min))
                (while (/= 0 (- (point)
                                (forward-list))))
                t)
            (scan-error (signal 'scan-error '("Region parentheses not balanced")))))))))

;; (load-library "php-config")
(use-package php-mode
  :disabled t
  :mode ("\\.inc\\'" . php-mode)
  :bind (:map php-mode-map
              ("M-S-<up>"  . flymake-goto-prev-error)
              ("M-S-<down>" . flymake-goto-next-error)
              ("<return>" . newline-and-indent))
  :config
  (add-hook 'php-mode-hook
            '(lambda ()
               (progn (c-set-style "bsd")
                      (setq c-basic-offset 2)
                      (c-set-offset 'case-label '+)
                      (c-set-offset 'substatement-open 0)))))


(load-library "pollen-config")
(load-library "server-config")
(load-library "show-paren-config")


(use-package recentf
  :defer 10
  :bind ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 50
        recentf-max-saved-items 100))


(use-package ruby-mode
  :mode (("\\.rake\'" . ruby-mode)
         ("Rakefile\'" . ruby-mode)
         ("rakefile\'" . ruby-mode)
         ("\\.gemspec'" . ruby-mode)))


(use-package shell-script-mode
  :interpreter ("bash" . shell-script-mode))

(use-package solarized-theme
  :ensure t
  :if window-system
  :config
  (setq solarized-distinct-fringe-background t
        solarized-high-contrast-mode-line t))


(use-package typo-mode
  :config
  (setq-default typo-language "English")
  (defun enable-typo-mode ()
    (cond ((string-match "/_\\(drafts\\|posts\\)/.+\\.\\(markdown\\|\\md\\)$" buffer-file-name)
           (typo-mode 1))))
  (add-hook 'markdown-mode-hook 'enable-typo-mode))
(load-library "yasnippet-config")


;;; Customize

(setq custom-file (expand-file-name "settings.el" user-emacs-directory))
(load custom-file)

(load-library "auto-save-config")

;;; report initialization file loading

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
