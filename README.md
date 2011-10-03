In the *scratch* buffer:

     ;; So the idea is that you copy/paste this code into your *scratch* buffer,
     ;; hit C-j, and you have a working paslock.
     (url-retrieve
      "https://github.com/Sarcasm/paslock/raw/master/paslock-install.el"
      (lambda (s)
        (end-of-buffer)
        (eval-print-last-sexp)))
