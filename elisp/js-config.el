;;(require 'js-comint)
(custom-set-variables '(js2-basic-offset 2)
                      '(js2-bounce-indent-p 2))
(setq inferior-js-program-command "/opt/local/bin/node")
(setq inferior-js-mode-hook
      (lambda ()
        (ansi-color-for-comint-mode-on)
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)))))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
