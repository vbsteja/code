(defun initialize()
  (write "Hello world"))
(initialize)

(defun example-program-listing ()
  '(this is
     (a (program
         (listing)))))
(defun mkstr(&rest args)
   (with-output-to-string (s)
      (dolist (a args)(princ a s))))   

(defun surya-say()
    (write "Hello"))
(defun suyra())


