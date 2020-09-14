;;;; daft-lisp-test.asd

(asdf:defsystem #:daft-lisp-test
  :description "Describe daft-lisp-test here"
  :author "Dave <dave@somewhere.com>"
  :license  "No license"
  :version "0.0.1"
  :serial t
  :depends-on (#:hunchentoot
	       #:prometheus
	       #:prometheus.formats.text
	       #:restas)
  :components ((:file "package")
	       (:file "daft-lisp-test")
	       (:file "server")
	       (:file "main")))
