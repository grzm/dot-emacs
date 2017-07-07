(setq cider-cljs-repl
      "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")

(setq cider-prompt-save-file-on-load nil)
(setq cider-eval-result-prefix ";; => ")
(setq cider-font-lock-dynamically '(macro core function var))
(setq cider-boot-parameters "cider repl -s wait")
(setq cider-repl-pop-to-buffer-on-connect 'display-only)
