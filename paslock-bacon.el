;; See: http://www.emacswiki.org/emacs/PrettyLambda

(defvar paslock-bacon-image
  (create-image (expand-file-name (if (file-exists-p "~/.emacs.d/paslock/bacon.png")
                                      "~/.emacs.d/paslock/bacon.png"
                                    "~/pkg/paslock/bacon.png"))))

;; http://www.emacswiki.org/emacs/MultilineRegexp
(defvar paslock-bacon-regex
  "\\*\\* Made by \\(.*\\)$")

(defun paslock-bacon (beg end)
  "Cache les choses ne devant pas être vues :P."
  (save-excursion
    (goto-char beg)
    ;; note (elisp info node *Managing Overlays*):
    ;; A loop that scans the buffer forwards, creating overlays, can
    ;; run faster if you do `(overlay-recenter (point-max))' first.
    (overlay-recenter (point-max))
    (while (re-search-forward paslock-bacon-regex end t)
      (let ((o (car (overlays-at (match-beginning 0)))))
        (unless (and o (eq (overlay-get o 'type) 'paslock))
          (let ((overlay (make-overlay (match-beginning 1) (match-end 1))))
            (overlay-put overlay 'type 'paslock)
            (overlay-put overlay 'display paslock-bacon-image)))))))

(defun paslock-bacon-unfontify (beg end)
  (mapc #'(lambda (o)
            (when (eq (overlay-get o 'type) 'paslock)
              (delete-overlay o)))
        (overlays-in beg end)))

(define-minor-mode paslock-bacon-mode
  "Indicate where only a single space has been used."
  nil nil nil
  (cond ((not paslock-bacon-mode)
         (jit-lock-unregister 'paslock-bacon)
         (paslock-bacon-unfontify (point-min) (point-max)))
        (t (paslock-bacon (point-min) (point-max))
           (jit-lock-register 'paslock-bacon))))

;; dirty fix for having paslock-bacon-mode everywhere
(define-globalized-minor-mode real-global-paslock-bacon-mode
  paslock-bacon-mode (lambda ()
                      (if (not (minibufferp (current-buffer)))
                          (paslock-bacon-mode 1))))

(real-global-paslock-bacon-mode t)
