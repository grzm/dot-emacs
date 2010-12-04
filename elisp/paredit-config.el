(require 'paredit)
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
        (scan-error (signal 'scan-error '("Region parentheses not balanced")))))))) 

;; (defun paredit-backward-maybe-delete-region () 
;;   (interactive) 
;;   (if mark-active 
;;       (progn 
;;         (check-region-parens) 
;;         (cua-delete-region)) 
;;     (paredit-backward-delete))) 

;; (defun paredit-forward-maybe-delete-region () 
;;   (interactive) 
;;   (if mark-active 
;;       (progn 
;;         (check-region-parens) 
;;         (cua-delete-region)) 
;;     (paredit-forward-delete))) 

;; (eval-after-load 'paredit
;;   '(progn
;;      (define-key paredit-mode-map (kbd "<delete>") 'paredit-forward-maybe-delete-region)
;;      (define-key paredit-mode-map (kbd "DEL") 'paredit-backward-maybe-delete-region)
;;      (define-key paredit-mode-map (kbd ";")   'self-insert-command)))
