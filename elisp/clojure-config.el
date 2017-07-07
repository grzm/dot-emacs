(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
;; when breaking function calls in arguments, indent subsequent lines
;; the default indent rather than align arguments
(setq clojure-indent-style :align-arguments)
(add-hook
 'clojure-mode-hook
 (lambda ()
   (put-clojure-indent 'defui '(1 nil nil (1)))))
(add-hook 'clojure-mode-hook 'hc-toggle-highlight-trailing-whitespace)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
