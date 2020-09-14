(in-package #:daft-lisp-test)

(defparameter *example-registry* nil)
(defparameter *http-requests-counter* nil)

#+sbcl
(defun create-executable ()
  (sb-ext:save-lisp-and-die "daft-lisp-test" :executable t
			    :toplevel 'entry-point))

#+sbcl
(defun entry-point ()
  (main)
  (loop (sleep 1)))

(defun main ()
  (initialize-metrics)
  (restas:start :daft-lisp-test/server :port 4242))

(defun initialize-metrics ()
  (unless *example-registry*
    (setf *example-registry* (prom:make-registry))
    (let ((prom:*default-registry* *example-registry*))
      (setf *http-requests-counter*
            (prom:make-counter :name "http_requests_total"
                               :help "Counts http request"
                               :labels '("app"))))))

#||
(main)
||#
