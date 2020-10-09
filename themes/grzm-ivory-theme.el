(deftheme grzm-ivory
  "A light Emacs theme.")

(setq ivory-white-smoke "#f5f5f5")
(setq ivory-ghost-white "#f8f8ff")
(setq ivory-anti-flash-white "#f2f3f4")
(setq ivory-baby-powder "#fefefa")
(setq ivory-background ivory-anti-flash-white)
(setq ivory-base "black")
(setq ivory-gray "gray")

;; https://coolors.co/e63946-f1faee-a8dadc-457b9d-1d3557
(setq deep-red "#720026")
(setq deep-red-2 "#96031a")
(setq tufte-red "#a00000")
(setq imperial-red "#e63946")
(setq light-red "#ec9a9a")
(setq honeydew "#f1faee")
(setq powder-blue "#a8dadc")
(setq steel-blue "#457b9d")
(setq prussian-blue "#1d3557")

(custom-theme-set-faces
 'grzm-ivory
 `(default ((t (:background ,ivory-background :foreground ,ivory-base))))
 `(secondary-selection ((t (:background ,ivory-background :foreground ,ivory-base))))

 '(Info-quoted ((t (:underline "gray40" :weight bold))))
 '(aw-leading-char-face ((t (:background "red" :foreground "white" :weight bold))))
 `(default ((t (:background ,ivory-background :foreground ,ivory-base))))

 `(clojure-keyword-face ((t (:foreground ,prussian-blue :weight bold))))

 '(diff-added ((t (:inherit diff-changed :background "light green"))))
 '(diff-changed ((t (:background "light steel blue"))))
 '(diff-indicator-added ((t (:inherit diff-indicator-changed))))
 '(diff-indicator-changed ((t (:weight bold))))
 '(diff-indicator-removed ((t (:inherit diff-indicator-changed))))
 '(diff-removed ((t (:inherit diff-changed :background "sandy brown"))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :weight bold))))

 `(font-lock-builtin-face ((t (:foreground ,ivory-base))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "#aaaaaa" :slant italic))))
 `(font-lock-comment-face ((t (:foreground ,ivory-base :background "#eeeeee"))))
 `(font-lock-constant-face ((t (:foreground ,prussian-blue))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :slant italic :background "#eeeeee"))))
 `(font-lock-function-name-face ((t (:foreground ,ivory-base :weight bold))))
 `(font-lock-keyword-face ((t (:foreground ,ivory-base))))
 '(font-lock-negation-char-face ((t (:weight bold))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground ,ivory-base))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground ,ivory-base))))
 `(font-lock-string-face ((t (:foreground ,steel-blue :weight bold))))
 `(font-lock-type-face ((t (:foreground ,ivory-base :weight bold))))
 `(font-lock-variable-name-face ((t (:foreground ,ivory-base))))

 '(gnus-button ((t (:inherit button))))
 '(gnus-header-name ((t (:box (:line-width 1 :style released-button) :weight bold))))
 '(gnus-group-mail-1 ((t (:inherit gnus-group-mail-1-empty :weight bold))))
 '(gnus-group-mail-1-empty ((t (:foreground "DodgerBlue4"))))
 '(gnus-group-mail-2 ((t (:inherit gnus-group-mail-2-empty :weight bold))))
 '(gnus-group-mail-2-empty ((t (:foreground "DodgerBlue3"))))
 '(gnus-group-mail-3 ((t (:inherit gnus-group-mail-3-empty :weight bold))))
 '(gnus-group-mail-3-empty ((t (:foreground "DodgerBlue2"))))
 '(gnus-group-news-1 ((t (:inherit gnus-group-news-1-empty :weight bold))))
 '(gnus-group-news-1-empty ((t (:foreground "tomato4"))))
 '(gnus-group-news-2 ((t (:inherit gnus-group-news-2-empty :weight bold))))
 '(gnus-group-news-2-empty ((t (:foreground "tomato3"))))
 '(gnus-group-news-3 ((t (:inherit gnus-group-news-3-empty :weight bold))))
 '(gnus-group-news-3-empty ((t (:foreground "tomato2")))) '(header-line ((t (:inherit mode-line :inverse-video t))))
 '(hl-line ((t (:background "#f0f0f1"))))
 '(hl-paren-face ((t (:weight bold))) t)
 '(minibuffer-prompt ((t (:foreground "#0184bc" :box (:line-width -1 :style released-button) :weight bold))))
 '(mode-line ((t (:background "#f0f0f1"))))
 '(mode-line-inactive ((t (:inherit mode-line :foreground "#a0a1a7"))))

 '(org-agenda-date ((t (:inherit org-agenda-structure))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :underline t))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "dark green"))))
 '(org-agenda-structure ((t (:foreground "Blue1" :weight bold :height 1.1 :family "DeJaVu Sans"))))

 `(org-agenda-date ((t (:inherit fixed-pitch))))
 '(org-default ((t (:inherit variable-pitch))))
 `(org-block ((t (:inherit org-meta-line :foreground ,ivory-base :height 0.9))))
 `(org-block-begin-line ((t (:inherit org-meta-line :foreground ,ivory-gray :underline t :height 0.9))))
 '(org-block-end-line ((t (:inherit org-block-begin-line :overline t :underline nil))))
 `(org-date ((t (:inherit fixed-pitch :height 0.9))))
 `(org-document-info ((t (:foreground ,ivory-base))))
 `(org-document-info-keyword ((t (:inherit fixed-pitch :foreground ,ivory-gray :weight normal))))
 `(org-document-title ((t (:foreground ,ivory-base :weight bold))))
 `(org-drawer ((t (:inherit fixed-pitch :weight light :height 0.8))))
 `(org-ellipsis ((t (:foreground ,ivory-gray :weight normal))))
 `(org-headline-done ((t (:foreground ,prussian-blue))))
 `(org-hide ((t (:foreground ,ivory-background :family "Hiragino Sans"))))
 `(org-indent ((t (:inherit org-hide :family "Hiragino Sans"))))
 '(org-level-1 ((t (:inherit outline-1 :box nil))))
 '(org-level-2 ((t (:inherit outline-2 :box nil))))
 '(org-level-3 ((t (:inherit outline-3 :box nil))))
 '(org-level-4 ((t (:inherit outline-4 :box nil))))
 '(org-level-5 ((t (:inherit outline-5 :box nil))))
 '(org-level-6 ((t (:inherit outline-6 :box nil))))
 '(org-level-7 ((t (:inherit outline-7 :box nil))))
 '(org-level-8 ((t (:inherit outline-8 :box nil))))
 `(org-meta-line ((t (:inherit org-document-info-keyword :foreground ,ivory-gray :height 0.9))))
 `(org-special-keyword ((t (:inherit org-drawer))))
 `(org-todo ((t (:inherit variable-pitch :family "OfficinaSansITCStd" :foreground ,imperial-red :weight extra-bold))))
 `(org-verbatim ((t (:inherit fixed-pitch :foreground ,ivory-base :weight normal))))
 `(org-table ((t (:inherit fixed-pitch))))
 '(org-tag ((t (:weight bold))))

 '(outline-1 ((t (:inherit font-lock-function-name-face :weight bold))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :weight bold))))
 '(outline-3 ((t (:inherit font-lock-keyword-face :weight bold))))
 '(outline-4 ((t (:inherit font-lock-comment-face :weight bold))))
 '(outline-5 ((t (:inherit font-lock-type-face :weight bold))))
 '(outline-6 ((t (:inherit font-lock-constant-face :weight bold))))
 '(outline-7 ((t (:inherit font-lock-builtin-face :weight bold))))
 '(outline-8 ((t (:inherit font-lock-builtin-face :weight bold))))

 '(rcirc-my-nick ((t (:foreground "LightSkyBlue" :weight bold))))
 '(realgud-overlay-arrow1  ((t (:foreground "dark green"))))
 '(realgud-overlay-arrow2  ((t (:foreground "#c18401"))))
 '(realgud-overlay-arrow3  ((t (:foreground "gray60"))))
 '(realgud-bp-disabled-face      ((t (:foreground "gray60"))))
 '(realgud-bp-line-enabled-face  ((t (:underline "red"))))
 '(realgud-bp-line-disabled-face ((t (:underline "gray60"))))
 '(realgud-file-name             ((t :foreground "dark green")))
 '(realgud-line-number           ((t :foreground "#0184bc")))
 '(realgud-backtrace-number      ((t :foreground "#0184bc" :weight bold)))
 '(region ((t (:background "lightgoldenrod1"))))
 `(show-paren-match ((t (:foreground ,ivory-base :weight bold))))
 '(show-paren-mismatch ((t (:background "red" :weight bold))))
 '(window-number-face ((t (:foreground "red" :weight bold)))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'grzm-ivory)

;;; grzm-ivory-theme.el ends here
