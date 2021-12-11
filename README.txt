time-sheets

A simple timesheet/appointment chart generator from the REPL.
It can handle multiple months, any lessons will be pushed to the 
corresponding month's lesson list.

TIME-SHEETS> (taught 5 23 "Mozart" 30 "arrived")
(#<LESSON 5/23/21 | Mozart | 30 minutes | arrived>)

TIME-SHEETS> (taught 5 24 "Beethoven" 45 "30 + 15 makeup")
(#<LESSON 5/24/21 | Beethoven | 45 minutes | 30 + 15 makeup>
 #<LESSON 5/23/21 | Mozart | 30 minutes | arrived>)
 
TIME-SHEETS> (taught 5 5 "Schnittke" 60 "arrived")
(#<LESSON 5/5/21 | Schnittke | 60 minutes | arrived>
 #<LESSON 5/24/21 | Beethoven | 45 minutes | 30 + 15 makeup>
 #<LESSON 5/23/21 | Mozart | 30 minutes | arrived>)
 
TIME-SHEETS> (taught 5 17 "Bruckner" 0 "cancelled, makeup added")
(#<LESSON 5/17/21 | Bruckner | 0 minutes | cancelled, makeup added>
 #<LESSON 5/5/21 | Schnittke | 60 minutes | arrived>
 #<LESSON 5/24/21 | Beethoven | 45 minutes | 30 + 15 makeup>
 #<LESSON 5/23/21 | Mozart | 30 minutes | arrived>)
 
TIME-SHEETS> may-lessons
(#<LESSON 5/17/21 | Bruckner | 0 minutes | cancelled, makeup added>
 #<LESSON 5/5/21 | Schnittke | 60 minutes | arrived>
 #<LESSON 5/24/21 | Beethoven | 45 minutes | 30 + 15 makeup>
 #<LESSON 5/23/21 | Mozart | 30 minutes | arrived>)
 
TIME-SHEETS> (make-timesheet may-lessons)
#<TIMESHEET 
Lessons: 
#<LESSON 5/5/21 | Schnittke | 60 minutes | arrived>
#<LESSON 5/17/21 | Bruckner | 0 minutes | cancelled, makeup added>
#<LESSON 5/23/21 | Mozart | 30 minutes | arrived>
#<LESSON 5/24/21 | Beethoven | 45 minutes | 30 + 15 makeup>

Minutes: 135
*37/hr: $83.25>
TIME-SHEETS> 
