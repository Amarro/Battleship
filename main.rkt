#lang racket/gui

(require racket/draw)
(require (file "Two-player-GUI.rkt"))
;(provide gui-2-p)









;;font for the buttons
(define btn-font(make-object font%
                  18	 	 	 	 
                  'modern
                  'normal
                  'light))


;;You could use `message%' with the bitmap as its label:
(define background-img (read-bitmap "PIXILART-LOCAL.png"))

;;gui for the principal frame
(define mainFrame
  (new frame%
       [label "BattleShip"]
       [width 400]
       [height 400]
       [stretchable-width #f]	 
       [stretchable-height #f]
       ))

(define buttonContainer
  (new vertical-panel%
       [parent mainFrame]
       [vert-margin 20]	 
       [horiz-margin 100]
       [spacing 2]	 	 
       [min-width 100]	 
       [min-height 200]	 
       [stretchable-width #f]	 
       [stretchable-height #f]))



(define Single-p-button
  (new button%	 
   	 	[label "Single Player"]	 
   	 	[parent buttonContainer]	 
            ;[callback callback]	 
   	 	;[style (list 'border)]	 
   	 	[font btn-font]	 	 	 
   	 	[min-width 80]	 
   	 	[min-height 40]	 
   	 		 ))

(define Two-p-button
  (new button%	 
   	 	[label "2 Players"]	 
   	 	[parent buttonContainer]	 
                   [callback (lambda (button event)
                      (gui-2-p)
                      (send mainFrame show #f))]	 
   	 	[style (list 'border)]	 
   	 	[font btn-font]	 	 	 
   	 	[min-width 80]	 
   	 	[min-height 40]	 
   	 		 ))

(define Multiplayer-p-button
  (new button%	 
   	 	[label "Online"]	 
   	 	[parent buttonContainer]	 
            ;[callback callback]	  
   	 	[font btn-font]	 	 	 
   	 	[min-width 80]	 
   	 	[min-height 40]	 
   	 		 ))

(define Exit-p-button
  (new button%	 
   	 	[label "Exit"]	 
   	 	[parent buttonContainer]	 
           [callback (lambda (button event)
                        (send mainFrame show #f))]	 
   	 	[font btn-font]	 	 	 
   	 	[min-width 80]	 
   	 	[min-height 40]	 
   	 		 ))

       
(define backgroung (new message% [parent mainFrame] [label background-img]))
(send mainFrame show #t)
