;;; magic-config.el --- Based on Pretty-print lambdas

;; Author: Mark Triggs <mst@dishevelled.net>, Marvin

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This idea is *completely* stolen from Luke Gorrie's pretty-lambda.el.  I'm
;; just curious to see how easily it can be done with font-locking alone.
;; paslock

;;; Code:

;; http://www.emacswiki.org/emacs/MultilineRegexp
(defvar paslock-hide-regex
  ;; ";;;PASLOCK[\0-\377[:nonascii:]]*;;;!PASLOCK"
  ";; Autogenerated, do not edit. All changes will be undone.[\0-\377[:nonascii:]]*;; end of generated code.")

(defun paslock-hide (beg end)
  "Cache les choses ne devant pas être vues :P."
  (save-excursion
    (goto-char beg)
    ;; note (elisp info node *Managing Overlays*):
    ;; A loop that scans the buffer forwards, creating overlays, can
    ;; run faster if you do `(overlay-recenter (point-max))' first.
    (overlay-recenter (point-max))
    (while (re-search-forward paslock-hide-regex end t)
      (let ((o (car (overlays-at (match-beginning 0)))))
        (unless (and o (eq (overlay-get o 'type) 'paslock))
          (let ((overlay (make-overlay (match-beginning 0) (match-end 0))))
            (overlay-put overlay 'type 'paslock)
            (overlay-put overlay 'invisible t)))))))

(defun lambda-unfontify (beg end)
  (mapc #'(lambda (o)
            (when (eq (overlay-get o 'type) 'paslock)
              (delete-overlay o)))
        (overlays-in beg end)))

(define-minor-mode paslock-hide-mode
  "Indicate where only a single space has been used."
  nil nil nil
  (cond ((not paslock-hide-mode)
         (jit-lock-unregister 'paslock-hide)
         (lambda-unfontify (point-min) (point-max)))
        (t (paslock-hide (point-min) (point-max))
           (jit-lock-register 'paslock-hide))))

;; dirty fix for having paslock-hide-mode everywhere
(define-globalized-minor-mode real-global-paslock-hide-mode
  paslock-hide-mode (lambda ()
                      (if (not (minibufferp (current-buffer)))
                          (paslock-hide-mode 1))))

(real-global-paslock-hide-mode t)

(provide 'paslock-hide-mode)
;;; paslock-hide-mode.el ends here
