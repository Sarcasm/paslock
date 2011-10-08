;;; rick-roll.el --- Some cool stuff !

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

(defconst rick-roll-lyrics
  '("We’re no strangers to love,"
    "You know the rules and so do I."
    "A full commitment’s what I’m thinking of,"
    "You wouldnt get this from any other guy."

    "I just wanna tell you how I’m feeling,"
    "Gotta make you understand…"

    "Never gonna give you up,"
    "Never gonna let you down,"
    "Never gonna run around and desert you."
    "Never gonna make you cry,"
    "Never gonna say goodbye,"
    "Never gonna tell a lie and hurt you."

    "We’ve known each other for so long"
    "Your heart’s been aching"
    "But you’re too shy to say it."
    "Inside we both know what’s been going on,"
    "We know the game and we’re gonna play it."

    "Annnnnd if you ask me how I’m feeling,"
    "Don’t tell me you’re too blind to see…"

    "Never gonna give you up,"
    "Never gonna let you down,"
    "Never gonna run around and desert you."
    "Never gonna make you cry,"
    "Never gonna say goodbye,"
    "Never gonna tell a lie and hurt you."

    "Never gonna give you up,"
    "Never gonna let you down,"
    "Never gonna run around and desert you."
    "Never gonna make you cry,"
    "Never gonna say goodbye,"
    "Never gonna tell a lie and hurt you."

    "Give you up. give you up."
    "Give you up, give you up."
    "Never gonna give"
    "Never gonna give, give you up."
    "Never gonna give"
    "Never gonna give, give you up."

    "We’ve known each other for so long"
    "Your heart’s been aching"
    "But you’re too shy to say it."
    "Inside we both know what’s been going on,"
    "We know the game and we’re gonna play it."

    "I just wanna tell you how I’m feeling,"
    "Gotta make you understand…"

    "Never gonna give you up,"
    "Never gonna let you down,"
    "Never gonna run around and desert you."
    "Never gonna make you cry,"
    "Never gonna say goodbye,"
    "Never gonna tell a lie and hurt you."

    "Never gonna give you up,"
    "Never gonna let you down,"
    "Never gonna run around and desert you."
    "Never gonna make you cry,"
    "Never gonna say goodbye,"
    "Never gonna tell a lie and hurt you."

    "Never gonna give you up,"
    "Never gonna let you down,"
    "Never gonna run around and desert you."
    "Never gonna make you cry,"
    "Never gonna say goodbye,"
    "Never gonna tell a lie and hurt you."))

(defvar rick-roll-current-sentence nil)

(defun rick-roll-hook ()
  (unless rick-roll-current-sentence
    (let ((browse-url-generic-program "google-chrome")
          (browse-url-browser-function '(("^file:" . browse-file-url)
                                       ("."      . browse-url-generic))))
      (browse-url "http://20b.org")))
  (message "♫ %s ♪♪♪" (car (setq rick-roll-current-sentence
                           (or (cdr-safe rick-roll-current-sentence)
                               rick-roll-lyrics)))))

(run-with-idle-timer 10 nil (lambda ()
                              (add-hook 'post-command-hook 'rick-roll-hook)))

;; to be fair
;; (remove-hook 'post-command-hook 'rick-roll-hook)

(provide 'rick-roll)
;;; rick-roll.el ends here
