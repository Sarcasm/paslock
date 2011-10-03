;; Based on https://raw.github.com/Sarcasm/paslock/master/paslock-install.el

(let ((paslock-root
       (file-name-as-directory
	(or (bound-and-true-p paslock-dir)
	    (concat (file-name-as-directory user-emacs-directory) "paslock")))))

  (when (file-directory-p paslock-root)
    (add-to-list 'load-path paslock-root))

  ;; try to require paslock, failure means we have to install it
  (unless (require 'paslock nil t)
    (unless (file-directory-p paslock-root)
      (make-directory paslock-root t))

    (let* ((package   "paslock")
	   (buf       (switch-to-buffer "*paslock bootstrap*"))
	   (git       (or (executable-find "git")
			  (error "Unable to find `git'")))
	   (url       (if (bound-and-true-p paslock-git-install-url)
			  paslock-git-install-url
			"http://github.com/Sarcasm/paslock.git"))
	   (default-directory paslock-root)
	   (process-connection-type nil) ; pipe, no pty (--no-progress)

	   ;; First clone paslock
	   (status
	    (call-process
	     git nil `(,buf t) t "--no-pager" "clone" "-v" url package)))

      (unless (zerop status)
	(error "Couldn't clone paslock from the Git repository: %s" url))

      (append-to-file (format "
(add-to-list 'load-path (expand-file-name \"%s\"))
;; Auto generated code, do not edit manually !
(require 'paslock)
;; end of generated code.
"
                      paslock-root) nil user-init-file)

      (with-current-buffer buf
	(goto-char (point-max))
	(insert "\nCongrats, paslock is installed and ready to serve!")))))
