;;;;time-sheets.asd

(asdf:defsystem #:time-sheets
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "A tool for writing time-sheets/invoices of client appointments."
  :serial t
  :components ((:file "package")
	       (:file "time-sheets")))
