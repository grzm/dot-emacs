;;; minima-ebony-theme.el -- A light, spare Emacs theme -*- lexical-binding:t -*-

;;; Commentary:
;; This theme is designed to be light and spare.

;;; Code:

(deftheme minima-ebony
  "A dark, spare Emacs theme.")

(defgroup minima-theme ()
  "A dark, spare Emacs theme"
  :group 'faces
  :prefix "minima-theme-"
  :tag "Minima Ebony")

(defface minima-theme-heading-1 nil nil)
(defface minima-theme-heading-2 nil nil)
(defface minima-theme-heading-3 nil nil)
(defface minima-theme-heading-4 nil nil)
(defface minima-theme-heading-5 nil nil)
(defface minima-theme-heading-6 nil nil)
(defface minima-theme-heading-7 nil nil)
(defface minima-theme-heading-8 nil nil)
(defface minima-theme-hl-line nil nil)

(defcustom minima-ebony-theme-fringes nil
  "Define the visibility of fringes."
  :type '(choice
          (const :tag "No visible fringes (default)" nil)
          (const :tag "Subtle grayscale background" subtle)
          (const :tag "Intense grayscale background" intense)))

(defcustom minima-ebony-theme-scale-headings nil
  "Use font scaling for headings."
  :type 'boolean)

(defcustom minima-ebony-theme-scale-1 1.05
  "Font size that is slightly larger than the base value.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ebony-theme-scale-2 1.1
  "Font size slightly larger than `minima-ebony-theme-scale-1'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ebony-theme-scale-3 1.15
  "Font size slightly larger than `minima-ebony-theme-scale-2'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ebony-theme-scale-4 1.2
  "Font size slightly larger than `minima-ebony-theme-scale-3'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ebony-theme-use-variable-pitch-headings nil
  "Use proportional fonts (variable-pitch) in headings."
  :type 'boolean)

;;; Internal functions

(defun minima-ebony-theme-heading (level fg fg-alt bg border)
  "Conditional styles for `minima-ebony-theme-headings'.
LEVEL is the heading's position in their order.  FG is the
default text colour.  FG-ALT is an accented, more saturated value
than the default.  BG is a nuanced, typically accented,
background that can work well with either of the foreground
values.  BORDER is a colour value that combines well with the
background and alternative foreground."
  (let* ((var (if minima-ebony-theme-use-variable-pitch-headings
                  'variable-pitch
                'default)))
    (list :inherit `(bold ,var) :foreground fg)))

(defun minima-ebony-theme-fringe (subtle-bg intense-bg)
  "Conditional use of background colors for fringes.
SUBTLE-BG should be a subtle grayscale value.  INTENSE-BG must be a
more pronounced grayscale color."
  (pcase minima-ebony-theme-fringes
    ('intense (list :background intense-bg))
    ('subtle (list :background subtle-bg))
    (_ (list :background nil))))

(defun minima-ebony-theme-scale (amount)
  "Scale heading by AMOUNT.
AMOUNT is a customisation option."
  (when minima-ebony-theme-scale-headings
    (list :height amount)))


(eval-and-compile
  (defconst minima-ebony-theme-default-colors-alist
    '(;; base values
      ("bg-main" . "#000000") ("fg-main" . "#ffffff")
      ("bg-alt" . "#333333") ("fg-alt" . "#dddddd")
      ("bg-dim" . "#f8f8f8") ("fg-dim" . "#282828")

      ("fg-delim-1" . "#ffffff")
      ("fg-delim-2" . "#aaaaaa")
      ("fg-delim-3" . "#eeeeee")
      ("fg-delim-4" . "#999999")
      ("fg-delim-5" . "#dddddd")
      ("fg-delim-6" . "#888888")

      ("fg-paren-match" . "brightred")
      ("bg-paren-match" . "#000000")

      ("bg-active" . "#d7d7d7") ("fg-active" . "#0a0a0a")
      ("bg-inactive" . "#efefef") ("fg-inactive" . "#404148")

      ("red" . "#a60000") ("green" . "#005e00")
      ("yellow" . "#813e00") ("blue" . "#0031a9")
      ("magenta" . "#721045") ("cyan" . "#00538b")

      ("bg-region" . "#bcbcbc")

      ("fg-window-divider-inner" . "#888888")
      ("fg-window-divider-outer" . "#585858")
      )
    "`minima-ebony-theme' default palette.
Each element has the form (NAME . HEX).")

  (defcustom minima-ebony-theme-override-colors-alist '()
    "Association list of palette color overrides."
    :type '(alist
            :key-type (string :tag "Name")
            :value-type (string :tag "Hex")))

  (defmacro minima-ebony-theme-with-color-variables (&rest body)
    "`let' bind all colors around BODY.
Also bind `class' to ((class color) (min-colors 89))."
    (declare (indent 0))
    `(let ((class '((class color) (min-colors 89)))
           ,@(mapcar (lambda (cons)
                       (list (intern (car cons)) (cdr cons)))
                     (append minima-ebony-theme-default-colors-alist
                             minima-ebony-theme-override-colors-alist)))
       ,@body)))

;;; Faces
(minima-ebony-theme-with-color-variables
  (custom-theme-set-faces
   'minima-ebony

   `(minima-theme-heading-1
     ((,class ,@(minima-ebony-theme-heading 1 fg-main fg-main bg-main bg-region)
              ,@(minima-ebony-theme-scale minima-ebony-theme-scale-4))))
   `(minima-theme-heading-2
     ((,class ,@(minima-ebony-theme-heading 2 fg-main fg-main bg-main bg-region)
              ,@(minima-ebony-theme-scale minima-ebony-theme-scale-3))))
   `(minima-theme-heading-3
     ((,class ,@(minima-ebony-theme-heading 3 fg-main fg-main bg-main bg-region)
              ,@(minima-ebony-theme-scale minima-ebony-theme-scale-2))))
   `(minima-theme-heading-4
     ((,class ,@(minima-ebony-theme-heading 4 fg-main fg-main bg-main bg-region)
              ,@(minima-ebony-theme-scale minima-ebony-theme-scale-1))))
   `(minima-theme-heading-5
     ((,class ,@(minima-ebony-theme-heading 5 fg-main fg-main bg-main bg-region))))
   `(minima-theme-heading-6
     ((,class ,@(minima-ebony-theme-heading 6 fg-main fg-main bg-main bg-region))))
   `(minima-theme-heading-7
     ((,class ,@(minima-ebony-theme-heading 7 fg-main fg-main bg-main bg-region))))
   `(minima-theme-heading-8
     ((,class ,@(minima-ebony-theme-heading 8 fg-main fg-main bg-main bg-region))))

   ;;;; standard faces
   ;;;;; absolute essentials
   `(default ((,class :background ,bg-main :foreground ,fg-main)))
   `(cursor ((,class :background ,fg-main)))
   `(fringe ((,class ,@(minima-ebony-theme-fringe bg-inactive bg-active)
                     :foreground ,fg-main)))
   `(vertical-border ((,class :foreground ,fg-window-divider-inner)))


   `(bold ((,class :weight bold)))
   `(comint-highlight-input ((,class :inherit bold)))
   `(comint-highlight-prompt ((,class :inherit bold :foreground ,cyan)))
   `(error ((,class :inherit bold :foreground ,red)))
   `(escape-glyph ((,class :foreground ,fg-main)))
   `(file-name-shadow ((,class :foreground ,fg-main)))
   `(header-line ((,class :background ,bg-main :foreground ,fg-main)))
   `(header-line-highlight ((,class :foreground ,fg-main :background ,bg-main)))
   `(help-argument-name ((,class :foreground ,cyan)))
   `(homoglyph ((,class :foreground ,fg-main)))
   `(ibuffer-locked-buffer ((,class :foreground ,yellow)))
   `(italic ((,class :slant italic)))
   `(nobreak-hyphen ((,class :foreground ,fg-main)))
   `(nobreak-space ((,class :foreground ,fg-main :underline t)))
   `(minibuffer-prompt ((,class :foreground ,cyan)))
   `(mm-command-output ((,class :foreground ,red)))
   `(mm-uu-extract ((,class :background ,bg-dim :foreground ,fg-main)))
   `(next-error ((,class :inherit modus-theme-subtle-red)))
   `(rectangle-preview ((,class :inherit modus-theme-special-mild)))
   `(region ((,class :background ,bg-region :foreground ,fg-main)))
   `(secondary-selection ((,class :inherit modus-theme-special-cold)))
   `(shadow ((,class :foreground ,fg-alt)))
   `(success ((,class :inherit bold :foreground ,green)))
   `(trailing-whitespace ((,class :background ,red)))
   `(warning ((,class :inherit bold :foreground ,yellow)))

   ;;;;; buttons, links, widgets
   `(button ((,class :foreground ,fg-main :underline t)))
   `(link ((,class :inherit button)))
   `(link-visited ((,class :inherit link :foreground ,magenta)))
   `(tooltip ((,class :background ,bg-main :foreground ,fg-main)))
   `(widget-button ((,class :inherit button)))
   `(widget-button-pressed ((,class :inherit button :foreground ,fg-main)))
   `(widget-documentation ((,class :foreground ,green)))
   `(widget-field ((,class :background ,bg-alt :foreground ,fg-dim)))
   `(widget-inactive ((,class :background ,bg-inactive :foreground ,fg-inactive)))
   `(widget-single-line-field ((,class :inherit widget-field)))


   ;; `(diff-added ((,class :inherit default)))
   ;; `(diff-changed ((,class :inherit default)))
   ;; `(diff-context ((,class :inherit default)))
   ;; `(diff-file-header ((,class :inherit default)))
   ;; `(diff-function ((,class :inherit default)))
   ;; `(diff-header ((,class :inherit default)))
   ;; `(diff-hunk-header ((,class :inherit default)))
   ;; `(diff-index ((,class :inherit default)))
   ;; `(diff-indicator-added ((,class :inherit default)))
   ;; `(diff-indicator-changed ((,class :inherit default)))
   ;; `(diff-indicator-removed ((,class :inherit default)))
   ;; `(diff-nonexistent ((,class :inherit default)))
   `(diff-refine-added ((,class :background "#bbffbb")))
   ;; `(diff-refine-changed ((,class :inherit default)))
   `(diff-refine-removed ((,class :background "#ffcccc")))
   ;; `(diff-removed ((,class :inherit default)))



   ;;;;; font-lock
   `(font-lock-builtin-face ((,class :foreground ,fg-main :inherit 'bold)))
   `(font-lock-comment-delimiter-face ((,class :foreground ,fg-alt :background ,bg-alt)))
   `(font-lock-comment-face ((,class :foreground ,fg-alt :background ,bg-alt)))
   `(font-lock-constant-face ((,class :foreground ,fg-main)))
   `(font-lock-doc-face ((,class :foreground ,fg-alt)))
   `(font-lock-function-name-face ((,class :foreground ,fg-main)))
   `(font-lock-keyword-face ((,class :foreground ,fg-main)))
   `(font-lock-negation-char-face ((,class :foreground ,fg-main :weight bold)))
   `(font-lock-preprocessor-face ((,class :foreground ,fg-main)))
   `(font-lock-regexp-grouping-backslash ((,class :weight bold :foreground ,fg-main)))
   `(font-lock-regexp-grouping-construct ((,class :weight bold :foreground ,fg-main)))
   `(font-lock-string-face ((,class :foreground ,fg-main)))
   `(font-lock-type-face ((,class :foreground ,fg-main)))
   `(font-lock-variable-name-face ((,class :foreground ,fg-main)))
   `(font-lock-warning-face ((,class :foreground ,fg-main :weight bold)))


   ;;;;; line numbers (display-line-numbers-mode and global variant)
   `(line-number ((,class :inherit default :background ,bg-dim :foreground ,fg-alt)))
   `(line-number-current-line ((,class :inherit default :background ,bg-active :foreground ,fg-main)))


   ;;;;; magit
   ;; `(magit-bisect-bad ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-bisect-good ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-bisect-skip ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-date ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-dimmed ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-hash ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-margin ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-name ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-blame-summary ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-branch-current ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-branch-local ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-branch-remote ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-branch-remote-head ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-branch-upstream ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-cherry-equivalent ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-cherry-unmatched ((,class :background "#ddffdd" :foreground "#22aa22")))
   `(magit-diff-added ((,class :background "#ddffdd" :foreground "#22aa22")))
   `(magit-diff-added-highlight ((,class :background "#cceecc" :foreground "#22aa22")))
   ;; `(magit-diff-base ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-base-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-conflict-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-context ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-context-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-file-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-file-heading-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-file-heading-selection ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-hunk-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-hunk-heading-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-hunk-heading-selection ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-hunk-region ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-lines-boundary ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-lines-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-our ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-our-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   `(magit-diff-removed ((,class :background "#ffdddd" :foreground "#aa2222")))
   `(magit-diff-removed-highlight ((,class :background "#eecccc" :foreground "#aa2222")))
   ;; `(magit-diff-revision-summary ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-revision-summary-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-their ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-their-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diff-whitespace-warning ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diffstat-added ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-diffstat-removed ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-dimmed ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-filename ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-hash ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-head ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-header-line ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-header-line-key ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-header-line-log-select ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-keyword ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-keyword-squash ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-log-author ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-log-date ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-log-graph ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-mode-line-process ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-mode-line-process-error ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-process-ng ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-process-ok ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-amend ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-checkout ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-cherry-pick ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-commit ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-merge ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-other ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-rebase ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-remote ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-reflog-reset ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-refname ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-refname-pullreq ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-refname-stash ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-refname-wip ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-section-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-section-heading-selection ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-section-highlight ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-section-secondary-heading ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-done ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-drop ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-exec ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-head ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-onto ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-part ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-pick ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-sequence-stop ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-bad ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-error ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-expired ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-expired-key ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-good ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-revoked ((,class :background "#ddffdd" :foreground "#22aa22")))
   ;; `(magit-signature-untrusted ((,class :background "#ddffdd" :foreground "#22aa22")))


   ;;;;; mode-line
   `(mode-line ((,class :background ,bg-main :foreground ,fg-main :box ,fg-main)))
   `(mode-line-buffer-id ((,class :weight bold)))
   `(mode-line-emphasis ((,class :weight bold :foreground ,fg-main)))
   `(mode-line-highlight ((,class :background ,bg-main :foreground,fg-main :box (:line-width -1 :style pressed-button))))
   `(mode-line-inactive ((,class :background ,bg-main :foreground ,fg-main :box ,fg-main)))


   ;;;;;; org
   `(org-block ((,class :inherit fixed-pitch :foreground ,fg-main)))
   `(org-block-begin-line ((,class :inherit fixed-pitch :foreground ,fg-main
                                   :underline t)))
   `(org-block-end-line ((,class :inherit fixed-pitch :foreground ,fg-main
                                 :overline t :underline nil)))
   `(org-date ((,class :inherit fixed-pitch)))
   `(org-document-info ((,class :foreground ,fg-main)))
   `(org-document-info-keyword ((,class :foreground ,fg-main :weight normal)))
   `(org-document-title ((,class :foreground ,fg-main :weight bold)))
   `(org-ellipsis ((,class :foreground nil)))
   `(org-headline-done ((,class :foreground ,fg-main)))
   `(org-level-1 ((,class :inherit minima-theme-heading-1)))
   `(org-level-2 ((,class :inherit minima-theme-heading-2)))
   `(org-level-3 ((,class :inherit minima-theme-heading-3)))
   `(org-level-4 ((,class :inherit minima-theme-heading-4)))
   `(org-level-5 ((,class :inherit minima-theme-heading-5)))
   `(org-level-6 ((,class :inherit minima-theme-heading-6)))
   `(org-level-7 ((,class :inherit minima-theme-heading-7)))
   `(org-level-8 ((,class :inherit minima-theme-heading-8)))
   `(org-meta-line ((,class :background ,bg-main :foreground ,fg-main)))
   `(org-verbatim ((,class :inherit fixed-pitch :background ,bg-main :foreground ,fg-main)))


   ;;;;; rainbow-delimiters
   `(rainbow-delimiters-base-face-error ((,class :foreground ,red)))
   `(rainbow-delimiters-base-face ((,class :foreground ,fg-main)))
   `(rainbow-delimiters-depth-1-face ((,class :foreground ,fg-delim-1)))
   `(rainbow-delimiters-depth-2-face ((,class :foreground ,fg-delim-2)))
   `(rainbow-delimiters-depth-3-face ((,class :foreground ,fg-delim-3)))
   `(rainbow-delimiters-depth-4-face ((,class :foreground ,fg-delim-4)))
   `(rainbow-delimiters-depth-5-face ((,class :foreground ,fg-delim-5)))
   `(rainbow-delimiters-depth-6-face ((,class :foreground ,fg-delim-6)))
   `(rainbow-delimiters-depth-7-face ((,class :foreground ,fg-delim-1)))
   `(rainbow-delimiters-depth-8-face ((,class :foreground ,fg-delim-2)))
   `(rainbow-delimiters-depth-9-face ((,class :foreground ,fg-delim-3)))
   `(rainbow-delimiters-mismatched-face ((,class :foreground ,fg-main)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,red)))


   ;;;;; show-paren-mode
   `(show-paren-match ((,class :background ,bg-paren-match :foreground ,fg-paren-match)))
   `(show-paren-match-expression ((,class :background ,bg-alt :foreground ,fg-alt)))
   `(show-paren-mismatch ((,class :background ,bg-paren-match :foreground ,fg-paren-match)))

   ))

(provide-theme 'minima-ebony)

;;; minima-ebony-theme.el ends here
