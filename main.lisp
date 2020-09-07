(in-package #:test)

#+sbcl
(defun create-executable ()
  (sb-ext:save-lisp-and-die "test" :executable t
			    :toplevel 'entry-point))

#+sbcl
(defun entry-point ()
  (main)
  (loop (sleep 1)))

(defun main ()
  (hunchentoot:start
   (make-instance 'hunchentoot:easy-acceptor
   :port 4242)))
