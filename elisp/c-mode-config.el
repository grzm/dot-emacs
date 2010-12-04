(add-hook 'c-mode-hook
	   '(lambda ()
	     (if (string-match "pgsql" buffer-file-name)
		 (progn
		   (c-set-style "bsd")
		   (setq c-basic-offset 4) 
		   (setq tab-width 4)
		   (c-set-offset 'case-label '+)
		   (setq indent-tabs-mode t)
		   )
               (progn (c-set-style "bsd")
                      (setq c-basic-offset 2)
                      (c-set-offset 'case-label '+)))))
