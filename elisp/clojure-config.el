(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
;; when breaking function calls in arguments, indent subsequent lines
;; the default indent rather than align arguments
(setq clojure-defun-style-default-indent t)
