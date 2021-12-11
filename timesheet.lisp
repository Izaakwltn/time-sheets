;;;;timesheet.lisp
;;;;


;;;;Goal: to be able to input student data like "12 10 Marlene Thompson 45"
					;(defun lesson 12 10)
(defvar september-lessons '())
(defvar october-lessons '())
(defvar november-lessons '())
(defvar december-lessons '())

(defclass lesson ()
  ((month    :initarg :month
	     :accessor month)
   (day      :initarg :day
	     :accessor day)
   (student  :initarg :student
	     :accessor student)
   (duration :initarg :duration
	     :accessor duration)))

(defmethod print-object ((obj lesson) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((month month)
		     (day day)
		     (student student)
		     (duration duration))
	obj
      (format stream "~a ~a ~a ~a" month day student duration))))

(defun make-lesson (month day student duration)
  (make-instance 'lesson
		 :month month
		 :day   day
		 :student student
		 :duration duration))

(defun taught (month day student duration)
  (cond ((equal month 9)
	 (push (make-lesson month day student duration) september-lessons))
	 ((equal month 10)
	  (push (make-lesson month day student duration) october-lessons))
     	 ((equal month 11)
	  (push (make-lesson month day student duration) november-lessons))
	 ((equal month 12)
	  (push (make-lesson month day student duration) december-lessons))))

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
      (format stream "~%Lessons: ~%~{~a~%~}~%Minutes: ~a~%*37/hr: $~a" lessons minutes total))))

(defun make-timesheet (lesson-list)
  (make-instance 'timesheet
		 :lessons (organize-lessons lesson-list)
		 :minutes (reduce '+ (mapcar #'(lambda (l) (duration l)) lesson-list))
		 :total (float (* 37 (/ (reduce '+ (mapcar #'(lambda (l) (duration l)) lesson-list)) 60)))))

(defun organize-lessons (lesson-list)
  (sort lesson-list #'(lambda (x y) (< (day x) (day y)))))

(defun save-timesheet (filename lesson-list)
  ;(open (concatenate 'string "/programming/projects/cmq-timesheets/" filename ".txt"))
  (with-open-file (stream (concatenate 'string "home/izaakwalton/MEGAsync/programming/projects/cmq-timesheets/" filename ".txt")
			  :direction :output
			  :if-exists :supersede
			  :if-does-not-exist :create)
    
    (format stream "~%~a" (make-timesheet lesson-list))))

