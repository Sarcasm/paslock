Introduction
============

A beautiful package for Emacs that provide some features for 'not
locked' tek1 :).

Installation
------------

In the *scratch* buffer:

     ;; So the idea is that you copy/paste this code into your *scratch* buffer,
     ;; hit C-j, and you have a working paslock.
     (url-retrieve
      "https://github.com/Sarcasm/paslock/raw/master/paslock-install.el"
      (lambda (s)
        (end-of-buffer)
        (eval-print-last-sexp)))

Features
--------
- A rick-roll module
- Some abbrevs (when the user type "main" he get "mian")
- Few cursor motion modified (i.e.: <left> sometime move to more than
  one character)