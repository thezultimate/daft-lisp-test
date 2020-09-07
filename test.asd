;;;; test.asd

(asdf:defsystem #:test
  :description "Describe test here"
  :author "Dave <dave@somewhere.com>"
  :license  "No license"
  :version "0.0.1"
  :serial t
  :depends-on (#:hunchentoot)
  :components ((:file "package")
	       (:file "test")
	       (:file "main")))
