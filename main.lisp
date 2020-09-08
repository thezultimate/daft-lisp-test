(in-package #:daft-lisp-test)

#+sbcl
(defun create-executable ()
  (sb-ext:save-lisp-and-die "daft-lisp-test" :executable t
			    :toplevel 'entry-point))

#+sbcl
(defun entry-point ()
  (main)
  (loop (sleep 1)))

(defun main ()
  (push
   (hunchentoot:create-prefix-dispatcher "/" #'index)
   hunchentoot:*dispatch-table*)
  (hunchentoot:start
   (make-instance 'hunchentoot:easy-acceptor
		  :port 4242)))

(defun index ()
  (format nil "Common Lisp blows my head!"))
