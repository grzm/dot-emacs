(provide 'clean-up-buffer)

(defun clean-up-buffer ()
  "Indent the entire buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
