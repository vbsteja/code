;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(print "What is your name?")

(defvar name (read))

(defun hello-you (name)
  (print "Hello")
  (write name)
  (format t "~% Look at you ~A!" name))

(setq *print-case* :capitalize)

(hello-you name)

;;addition
(+ 2 3)

;;define a var
(defvar name "surya")

;;change a variables
(setf name "teja")

;;check equality
(equal name "surya")

