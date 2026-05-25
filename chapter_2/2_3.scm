#|
Exercise 2.3: Implement a representation for rectangles in
a plane. (Hint: You may want to make use of Exercise 2.2.) In
terms of your constructors and selectors, create procedures
that compute the perimeter and the area of a given rectan-
gle. Now implement a different representation for rectan-
gles. Can you design your system with suitable abstraction
barriers, so that the same perimeter and area procedures
will work using either representation?
|#

;segments
(define (make-segment x y) (cons x y))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s)) 

;points
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;rectangle
(define (make-rectangle segment-top segment-left)
  (cons segment-top segment-left)
)

(define (rect-top-segment r) (car r))
(define (rect-left-segment r) (cdr r))

(define (rect-get-height r)
 (define left (rect-left-segment r))

  (let (
	(left-start (start-segment left))
	(left-end (end-segment left))
     )
     (- (y-point left-end) (y-point left-start))
     ))

(define (rect-get-width r)
  (define top (rect-top-segment r))
  (let (
	(top-start (start-segment top))
	(top-end (end-segment top))
     )
     (- (x-point top-end) (x-point top-start))
     ))


;rectangle methods

;perimeter == 2(w+h)
;area == w * h
(define (rect-get-perimeter r)
 (* 2 (+ (rect-get-width r) (rect-get-height r))) 
)

(define (rect-get-area r)
  (* (rect-get-width r) (rect-get-height r))
  )

;dont ask me to do this again this is the most tedious task i've done
(let (
      (rect (make-rectangle
	 ;top
	 (make-segment
	   (make-point 2 4) (make-point 4 4)
	   )

	;left
	 (make-segment
	   (make-point 2 2) (make-point 2 4)
	  ) 
	 ))
      )

  (print "rect:" rect)
  (print "area: " (rect-get-area rect))
  (print "perimeter: " (rect-get-perimeter rect))
  )

