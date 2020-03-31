(defun grzm/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil
                        :weight 'normal
                        :height 1.0
                        :inherit nil)))

(add-hook 'org-mode-hook 'grzm/org-mode-hook)

(define-key global-map "\C-cc" 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-ellipsis "↩")
(setq org-refile-use-outline-path t)


(defun org-todo-checkbox (&optional pos)
  (let ((todo (org-entry-get (or pos (point)) "TODO" t)))
    (cond
     ((string= todo "TODO") "[ ]")
     ((string= todo "DONE")  "[X]")
     (t "[/]"))))

(defun org-d24c-category (&optional pos)
  (let ((category (org-entry-get (or pos (point)) "CATEGORY" t)))
    (if (and category (not (string= category "")))
        (format "[%s]" category)
      "")))

(defun org-d24c-prefix (&optional pos)
  (format "%s %s" (org-todo-checkbox pos) (org-d24c-category pos)))

(setq org-support-shift-select t)
