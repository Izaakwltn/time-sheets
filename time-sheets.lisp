;;;;timesheet.lisp
;;;;

(in-package :time-sheets)

;;;;------------------------------------------------------------------------
;;;;Lesson Lists to be filled by #'taught
;;;;------------------------------------------------------------------------

(defvar january-lessons '())
(defvar february-lessons '())
(defvar march-lessons '())
(defvar april-lessons '())
(defvar may-lessons '())
(defvar june-lessons '())
(defvar july-lessons '())
(defvar august-lessons '())
(defvar september-lessons '())
(defvar october-lessons '())
(defvar november-lessons '())
(defvar december-lessons '())


;;;;------------------------------------------------------------------------
;;;;Defining the lesson class
;;;;------------------------------------------------------------------------

(defclass lesson ()
  ((month    :initarg :month
	     :accessor month)
   (day      :initarg :day
	     :accessor day)
   (student  :initarg :student
	     :accessor student)
   (duration :initarg :duration
	     :accessor duration)
   (status   :initarg :status
	     :accessor status))) ;;;"arrived" "cancelled" "make-up added" etc...

(defmethod print-object ((obj lesson) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((month month)
		     (day day)
		     (student student)
		     (duration duration)
		     (status status))
	obj
      (format stream "~a/~a/21 | ~a | ~a minutes | ~a" month day student duration status))))

(defun make-lesson (month day student duration status)
  "Makes a lesson object."
  (make-instance 'lesson
		 :month    month
		 :day      day
		 :student  student
		 :duration duration
		 :status   status))

(defun taught (month day student duration status)
  "Makes a lesson object and pushes it to the corresponding month."
  (cond ((equal month 1)
	 (push (make-lesson month day student duration status) january-lessons))
	((equal month 2)
	 (push (make-lesson month day student duration status) february-lessons))
	((equal month 3)
	 (push (make-lesson month day student duration status) march-lessons))
	((equal month 4)
	 (push (make-lesson month day student duration status) april-lessons))
	((equal month 5)
	 (push (make-lesson month day student duration status) may-lessons))
	((equal month 6)
	 (push (make-lesson month day student duration status) june-lessons))
	((equal month 7)
	 (push (make-lesson month day student duration status) july-lessons))
	((equal month 8)
	 (push (make-lesson month day student duration status) august-lessons))
        ((equal month 9)
	 (push (make-lesson month day student duration status) september-lessons))
	((equal month 10)
	 (push (make-lesson month day student duration status) october-lessons))
     	((equal month 11)
	 (push (make-lesson month day student duration status) november-lessons))
	((equal month 12)
	 (push (make-lesson month day student duration status) december-lessons))
	(t (format t "Not a Valid Month"))))

(defclass timesheet ()
  ((lessons :initarg :lessons
	    :accessor lessons)
   (minutes :initarg :minutes
	    :accessor minutes)
   (total   :initarg :total
	    :accessor total)))

(defmethod print-object ((obj timesheet) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((lessons lessons)
		     (minutes minutes)
		     (total total))
	obj
      (format stream
	      "~%Lessons: ~%~{~a~%~}~%Minutes: ~a~%*37/hr: $~a"
	      lessons
	      minutes
	      total))))

(defun organize-lessons (lesson-list)
  "Sorts the lessons by date."
  (sort lesson-list #'(lambda (x y) (< (day x) (day y)))))

(defun make-timesheet (lesson-list)'
  "Makes and prints a timesheet given a month's lesson list."
  (make-instance 'timesheet
		 :lessons (organize-lessons lesson-list)
		 :minutes (reduce '+ (mapcar #'(lambda (l) (duration l)) lesson-list))
		 :total (float (* 37 (/ (reduce '+ (mapcar #'(lambda (l) (duration l)) lesson-list)) 60)))))





;;;;------------------------------------------------------------------------
;;;;Next: Figure out how to save a dedicated file, maybe output as html or xml or latex
;;;;------------------------------------------------------------------------

;(defun save-timesheet (filename lesson-list)
  ;(open (concatenate 'string "/programming/projects/cmq-timesheets/" filename ".txt"))
;  (with-open-file (stream (concatenate 'string #p/" filename ".txt")
;			  :direction :output
;			  :if-exists :supersede
;			  :if-does-not-exist :create)
    
 ;   (format stream "~%~a" (make-timesheet lesson-list))))
;
