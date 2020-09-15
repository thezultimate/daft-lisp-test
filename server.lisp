(in-package #:daft-lisp-test)

(restas:define-module #:daft-lisp-test/server
  (:use #:cl
	#:daft-lisp-test))

(in-package #:daft-lisp-test/server)

(restas:define-route root ("" :method :get :content-type "text/plain")
  (hello))

(restas:define-route metrics ("metrics" :method :get :content-type "text/plain")
  (:decorators #'restas:@no-cache)
  "Exposing metrics endpoint"
  (prom.text:marshal daft-lisp-test:*example-registry*))

(defun hello ()
  (prom:counter.inc daft-lisp-test:*http-requests-counter* :labels '("app"))
  (format nil "Common Lisp is for cool developers!"))
