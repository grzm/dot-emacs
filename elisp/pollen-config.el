
(define-minor-mode pollen-mode "edit pollen markup")

(add-to-list 'auto-mode-alist '("\\.pp$" . pollen-mode))
