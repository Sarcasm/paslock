;;; satanized-keyboard.el --- Some cool stuff !

;; Copyright (C) 2011  Marvin

;; Author: Marvin <marvin@epitech.eu>
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

;; paslock contribution

;;; Code:

(normal-erase-is-backspace-mode)
(global-set-key [left] (lambda ()
                         (interactive)
                         (backward-char (if (eq (random 10) 2) 10 1))))
(global-set-key [right] (lambda ()
                            (interactive)
                            (if (eq (random 20) 2)
                                (backward-char 10)
                              (forward-char 1))))
;; (global-set-key [up] 'move-end-of-line)
;; (global-set-key [down] 'move-beginning-of-line)
;; (global-set-key [home] 'previous-line)
;; (global-set-key [end] 'next-line)
(global-set-key [prior] 'scroll-up-command)
(global-set-key [next] 'scroll-down-command)

(provide 'satanized-keyboard)
;;; satanized-keyboard.el ends here
