;;; annoying-splitting.el --- Annoying window splitting

;; Copyright (C) 2011  Guillaume Papin

;; Author: Guillaume Papin <guillaume.papin@epitech.eu>
;; Keywords: fun

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; paslock

;;; Code:

(defvar annoying-splitting-last-split t)

(defun annoying-splitting-hook ()
  (when (eq (char-before) ?m)
    (run-with-timer 3 nil
                    (lambda ()
                      (if (setq annoying-splitting-last-split
                                (not annoying-splitting-last-split))
                          (split-window-above-each-other)
                        (split-window-side-by-side))))))

(add-hook 'post-command-hook 'annoying-splitting-hook)

(provide 'annoying-splitting)
;;; annoying-splitting.el ends here
