(add-hook 'php-mode-hook 
          '(lambda ()
             (progn (c-set-style "bsd")
                    (setq c-basic-offset 2)
                    (c-set-offset 'case-label '+))))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode)
