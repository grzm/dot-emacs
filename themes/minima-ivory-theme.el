;;; minima-ivory-theme.el -- A light, spare Emacs theme -*- lexical-binding:t -*-

;;; Commentary:
;; This theme is designed to be light and spare.

;;; Code:

(deftheme minima-ivory
  "A light, spare Emacs theme.")

(defgroup minima-theme ()
  "A light, spare Emacs theme"
  :group 'faces
  :prefix "minima-theme-"
  :tag "Minima Ivory")

(defface minima-theme-heading-1 nil nil)
(defface minima-theme-heading-2 nil nil)
(defface minima-theme-heading-3 nil nil)
(defface minima-theme-heading-4 nil nil)
(defface minima-theme-heading-5 nil nil)
(defface minima-theme-heading-6 nil nil)
(defface minima-theme-heading-7 nil nil)
(defface minima-theme-heading-8 nil nil)
(defface minima-theme-hl-line nil nil)

(defcustom minima-ivory-theme-fringes nil
  "Define the visibility of fringes."
  :type '(choice
          (const :tag "No visible fringes (default)" nil)
          (const :tag "Subtle grayscale background" subtle)
          (const :tag "Intense grayscale background" intense)))

(defcustom minima-ivory-theme-scale-headings nil
  "Use font scaling for headings."
  :type 'boolean)

(defcustom minima-ivory-theme-scale-1 1.05
  "Font size that is slightly larger than the base value.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ivory-theme-scale-2 1.1
  "Font size slightly larger than `minima-ivory-theme-scale-1'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ivory-theme-scale-3 1.15
  "Font size slightly larger than `minima-ivory-theme-scale-2'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ivory-theme-scale-4 1.2
  "Font size slightly larger than `minima-ivory-theme-scale-3'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).
For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :type 'number)

(defcustom minima-ivory-theme-use-variable-pitch-headings nil
  "Use proportional fonts (variable-pitch) in headings."
  :type 'boolean)

;;; Internal functions

(defun minima-ivory-theme-heading (level fg fg-alt bg border)
  "Conditional styles for `minima-ivory-theme-headings'.
LEVEL is the heading's position in their order.  FG is the
default text colour.  FG-ALT is an accented, more saturated value
than the default.  BG is a nuanced, typically accented,
background that can work well with either of the foreground
values.  BORDER is a colour value that combines well with the
background and alternative foreground."
  (let* ((var (if minima-ivory-theme-use-variable-pitch-headings
                  'variable-pitch
                'default)))
    (list :inherit `(bold ,var) :foreground fg)))

(defun minima-ivory-theme-fringe (subtle-bg intense-bg)
  "Conditional use of background colors for fringes.
SUBTLE-BG should be a subtle grayscale value.  INTENSE-BG must be a
more pronounced grayscale color."
  (pcase minima-ivory-theme-fringes
    ('intense (list :background intense-bg))
    ('subtle (list :background subtle-bg))
    (_ (list :background nil))))

(defun minima-ivory-theme-scale (amount)
  "Scale heading by AMOUNT.
AMOUNT is a customisation option."
  (when minima-ivory-theme-scale-headings
    (list :height amount)))

(eval-and-compile
  (defconst minima-ivory-theme-default-colors-alist
    '(;; base values
      ("bg-main" . "#f2f3f4") ("fg-main" . "#000000")
      ("bg-alt" . "#f0f0f0") ("fg-alt" . "#505050")
      ("bg-dim" . "#f8f8f8") ("fg-dim" . "#282828")

      ("bg-active" . "#d7d7d7") ("fg-active" . "#0a0a0a")
      ("bg-inactive" . "#efefef") ("fg-inactive" . "#404148")

      ("red" . "#a60000") ("green" . "#005e00")
      ("yellow" . "#813e00") ("blue" . "#0031a9")
      ("magenta" . "#721045") ("cyan" . "#00538b")

      ("bg-region" . "#bcbcbc")
      
      ("fg-window-divider-inner" . "#888888")
      ("fg-window-divider-outer" . "#585858")
      )
    "`minima-ivory-theme' default palette.
Each element has the form (NAME . HEX).")

  (defcustom minima-ivory-theme-override-colors-alist '()
    "Association list of palette color overrides."
    :type '(alist
            :key-type (string :tag "Name")
            :value-type (string :tag "Hex")))

  (defmacro minima-ivory-theme-with-color-variables (&rest body)
    "`let' bind all colors around BODY.
Also bind `class' to ((class color) (min-colors 89))."
    (declare (indent 0))
    `(let ((class '((class color) (min-colors 89)))
           ,@(mapcar (lambda (cons)
                       (list (intern (car cons)) (cdr cons)))
                     (append minima-ivory-theme-default-colors-alist
                             minima-ivory-theme-override-colors-alist)))
       ,@body)))

;;; Faces
(minima-ivory-theme-with-color-variables
  (custom-theme-set-faces
   'minima-ivory

   `(minima-theme-heading-1
     ((,class ,@(minima-ivory-theme-heading 1 fg-main fg-main bg-main bg-region)
              ,@(minima-ivory-theme-scale minima-ivory-theme-scale-4))))
   `(minima-theme-heading-2
     ((,class ,@(minima-ivory-theme-heading 2 fg-main fg-main bg-main bg-region)
              ,@(minima-ivory-theme-scale minima-ivory-theme-scale-3))))
   `(minima-theme-heading-3
     ((,class ,@(minima-ivory-theme-heading 3 fg-main fg-main bg-main bg-region)
              ,@(minima-ivory-theme-scale minima-ivory-theme-scale-2))))
   `(minima-theme-heading-4
     ((,class ,@(minima-ivory-theme-heading 4 fg-main fg-main bg-main bg-region)
              ,@(minima-ivory-theme-scale minima-ivory-theme-scale-1))))
   `(minima-theme-heading-5
     ((,class ,@(minima-ivory-theme-heading 5 fg-main fg-main bg-main bg-region))))
   `(minima-theme-heading-6
     ((,class ,@(minima-ivory-theme-heading 6 fg-main fg-main bg-main bg-region))))
   `(minima-theme-heading-7
     ((,class ,@(minima-ivory-theme-heading 7 fg-main fg-main bg-main bg-region))))
   `(minima-theme-heading-8
     ((,class ,@(minima-ivory-theme-heading 8 fg-main fg-main bg-main bg-region))))

   ;;;; standard faces
   ;;;;; absolute essentials
   `(default ((,class :background ,bg-main :foreground ,fg-main)))
   `(cursor ((,class :background ,fg-main)))
   `(fringe ((,class ,@(minima-ivory-theme-fringe bg-inactive bg-active)
                     :foreground ,fg-main)))
   `(vertical-border ((,class :foreground ,fg-window-divider-inner)))

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
   ))

(provide-theme 'minima-ivory)

;;; minima-ivory-theme.el ends here
