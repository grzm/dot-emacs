(add-hook 'php-mode-hook
          '(lambda ()
             (progn (c-set-style "bsd")
                    (setq c-basic-offset 2)
                    (c-set-offset 'case-label '+)
                    (c-set-offset 'substatement-open 0))))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;(add-hook 'php-mode-hook '(lambda() (autopair-mode 1)))
;;(require 'flymake)
;;(add-hook 'php-mode-hook '(lambda() (flymake-mode 1)))

(eval-after-load 'php-mode
  '(progn
     (define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
     (define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)
     (define-key php-mode-map (kbd "<return>") 'newline-and-indent)))
