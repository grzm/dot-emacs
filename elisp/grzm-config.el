(require 'browse-kill-ring)
(require 'column-marker)
(require 'clean-up-buffer)

(add-hook 'font-lock-mode-hook (lambda () (interactive) (column-marker-1 80)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; hide toolbar
(tool-bar-mode -1)

;; Increase the number of recent items saved.
(setq recentf-max-menu-items 50)


(setq-default indent-tabs-mode nil) ;; insert multiple spaces instead of tabs
;; Use C-x C-m as a shortcut for M-x: Let's save our small fingers!
;; Hint from Steve Yegge: http://steve.yegge.googlepages.com/effective-emacs
;; Invoice M-x without the alt key
(global-set-key "\C-x\C-m" 'execute-extended-command)
;; Steve also recommends adding C-c C-m to allow for slop in hitting C-x
;; Don't know if I'll need that now, but it might be nice in the future
;;(global-set-key "\C-x\C-m" 'execute-extended-command)
;; However, I often mistype C-x m and I don't use mail, so
(global-set-key "\C-xm" 'execute-extended-command)
	
;;; Unbind `C-x f', which, by default sets fill-text width, which is uncommon
(global-unset-key "\C-xf")

;;; Rebind `C-x C-b' for 'buffer-menu', rather than list-buffers
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Item 3: Prefer backward-kill-word over Backspace
;; Another of Steve Yegge's hints
;; For fast typists, it's faster to retype a word rather than backspace
;; to fix just the error, so map this to C-w. However, C-w is already
;; mapped for kill-region, so remap kill-region to C-x C-k
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;; Again, Steve maps C-c C-k as well
;; (global-set-key "\C-c\C-k" 'kill-region)

;; Item 9: Master Emacs's regular expressions
;; Bind M-r and M-s to isearch-forward-regexp and isearch-backward-regexp
;; Note that this stomps on the default binding for move-to-window-line (M-r)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'search-backward-regexp)

;; Since query-replace-regexp and (replace-regexp) are so useful,
;; give them abbreviated aliases
(defalias 'rr 'replace-regexp)
(defalias 'qrr 'query-replace-regexp)

;; from http://wiki.rubygarden.org/Ruby/page/show/InstallingEmacsExtensions
;; This is also of interrest, it automagically does a "chmod u+x" when you
;; save a script file (starting with "#!").
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(defvar gtd-file "~/Documents/lists/gtd.org")
(defun gtd ()
  "Visit gtd.org file"
  (interactive)
  (find-file gtd-file))

(defvar myb-file "~/Documents/myb/myb.txt")
(defun myb ()
  "Visit myYearbook notes file"
  (interactive)
  (find-file myb-file))

(defun sq()
  "Switch to sql-mode"
  (interactive)
  (sql-mode))

(put 'downcase-region 'disabled nil)
(setq recentf-max-menu-items 30)
