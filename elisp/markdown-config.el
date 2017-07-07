(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(setq markdown-command "/Users/grzm/homebrew/bin/multimarkdown")

;;(autoload 'gfm-mode "gfm-mode"
;;  "Major mode for editing GitHub Flavored Markdown files" t)
;;(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;;(add-to-list 'auto-mode-alist '("README\\.markdown\\'" . gfm-mode))
