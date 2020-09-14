;;;; package.lisp

(defpackage #:daft-lisp-test
  (:use #:cl)
  (:export #:main
	   #:create-executable
	   #:*example-registry*
	   #:*http-requests-counter*))
