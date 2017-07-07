(setq-default typo-language "English")
;;(autoload 'typo-mode "typo.el" "Minor mode for typographic editing" t)
;;(add-to-list 'auto-mode-alist '("/_drafts/" . typo-mode))

(defun enable-typo-mode ()
  (cond ((string-match "/_\\(drafts\\|posts\\)/.+\\.\\(markdown\\|\\md\\)$" buffer-file-name)
         (typo-mode 1))))

(add-hook 'markdown-mode-hook 'enable-typo-mode)
