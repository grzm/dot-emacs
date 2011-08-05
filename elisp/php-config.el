(add-hook 'php-mode-hook
          '(lambda ()
             (progn (c-set-style "bsd")
                    (setq c-basic-offset 2)
                    (c-set-offset 'case-label '+)
                    (c-set-offset 'substatement-open 0))))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(require 'flymake)
(add-hook 'php-mode-hook (lambda() (flymake-mode 1)))
(add-hook 'php-mode-hook (lambda() (autopair-mode)))

(eval-after-load 'php-mode
  '(progn
     (define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
     (define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)))
