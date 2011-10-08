;; See: http://www.emacswiki.org/emacs/PrettyLambda

(defvar paslock-bacon-image
  (create-image "~/pkg/paslock/bacon.png"))

(defvar paslock-bacon-font-lock-keywords
  '((".+" (0 (prog1 nil
               (paslock-bacon-remove-region
                (match-beginning 0) (match-end 0)))))
    ("(\\(lambda\\)\\>"
     (0 (prog1 nil
          (paslock-bacon-region (match-beginning 1) (match-end 1)))))))

(defun paslock-bacon-remove-region (beg end)
  "Remove big lambda property in region between BEG and END."
  (let (pos)
    (while (setq pos (text-property-any beg end 'display paslock-bacon-image))
      (remove-text-properties
       pos
       (or (next-single-property-change pos 'display) end)
       '(display)))))

(defun paslock-bacon-region (beg end)
  "Add big lambda property in region between BEG and END."
  (put-text-property beg end 'display paslock-bacon-image))

(define-minor-mode paslock-bacon-mode
  "Display big lambda."
  :lighter " Lambda"
  (if paslock-bacon-mode
      (progn
        (save-restriction
          (widen)
          (let ((font-lock-keywords paslock-bacon-font-lock-keywords))
            (font-lock-fontify-buffer)))
        (font-lock-add-keywords nil paslock-bacon-font-lock-keywords))
    (font-lock-remove-keywords nil paslock-bacon-font-lock-keywords)
    (save-restriction
      (widen)
      (let ((modified-p (buffer-modified-p)))
        (paslock-bacon-remove-region (point-min) (point-max))
        (set-buffer-modified-p modified-p)))))

(defun paslock-bacon-mode-turn-on ()
  "Turn on `paslock-bacon-mode'."
  (interactive)
  (paslock-bacon-mode 1))

(add-hook 'emacs-lisp-mode 'paslock-bacon-mode-turn-on)
