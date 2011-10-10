;;; c-stuff.el --- C diabolisation

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

;; paslock

;;; Code:

(setq abbrev-file-name "/tmp/lol.el")

(add-hook 'c-mode-hook
          (lambda ()
            (define-abbrev-table 'c-mode-abbrev-table
              '(
                ("main"	"mian")
                ("while" "wihle")
                ("toto" "tata")
                ("i" "j")
                ("titi" "tixti")
		("for" "forbidden /* mouhahaha !*/")
                ("strlen" "strlen" (lambda ()
                                     (if (string= (symbol-at-point) "my_strlen")
                                         (backward-char 9)
                                       (forward-char 2))))
                ("putstr" "putstr" (lambda ()
                                     (if (string= (symbol-at-point) "my_putstr")
                                         (save-excursion
                                           (insert "/* printf() c'est plus mieux */")))))
                ("0" "'0'")
                ("return" "return/* c'est bientôt la fin ! */" (lambda ()
                                                               (backward-char 28)))
                ("malloc" "malloc/* libère la mémoire ! */" (lambda ()
                                                               (backward-char 22)))))))

(provide 'c-stuff)
;;; c-stuff.el ends here
