(defun com.grzm/cider-last-sexp (&optional bounds)
  "Return the sexp preceding the point.
If BOUNDS is non-nil, return a list of its starting and ending position
instead."
  (apply (if bounds #'list #'buffer-substring-no-properties)
         (save-excursion
           (clojure-backward-logical-sexp 1)
           (list (point)
                 (progn (clojure-forward-logical-sexp 1)
                        (point))))))

(defun cider-eval-print-with-comment-handler (buffer location comment-prefix)
  "Make a handler for evaluating and printing commented results in BUFFER.

LOCATION is the location at which to insert.
COMMENT-PREFIX is the comment prefix to use."
  (nrepl-make-response-handler buffer
                               (lambda (buffer value)
                                 (with-current-buffer buffer
                                   (save-excursion
                                     (goto-char location)
                                     (insert (concat comment-prefix value)))))
                               (lambda (_buffer out)
                                 (cider-emit-interactive-eval-output out))
                               (lambda (_buffer err)
                                 (cider-emit-interactive-eval-err-output err))
                               '()))

(defun com.grzm/cider-eval-last-sexp-to-comment ()
  "Evaluate the expression preceding point.
Print its value into the current buffer."
  (interactive)
  (let* ((bounds (com.grzm/cider-last-sexp 'bounds))
         (insertion-point (nth 1 bounds)))
    (cider-interactive-eval nil
                            (com.grzm/cider-eval-print-with-comment-handler
                             (current-buffer) insertion-point cider-eval-result-prefix)
                            (cider-last-sexp 'bounds))))


