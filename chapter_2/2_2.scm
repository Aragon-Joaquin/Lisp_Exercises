#|
Exercise 2.2: Consider the problem of representing line
segments in a plane. Each segment is represented as a pair
of points: a starting point and an ending point. Define a
constructor make-segment and selectors start-segment and
end-segment that define the representation of segments in
terms of points. Furthermore, a point can be represented
as a pair of numbers: the x coordinate and the y coordi-
nate. Accordingly, specify a constructor make-point and
selectors x-point and y-point that define this representa-
tion. Finally, using your selectors and constructors, define a
procedure midpoint-segment that takes a line segment as
argument and returns its midpoint (the point whose coor-
dinates are the average of the coordinates of the endpoints).
To try your procedures, you’ll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
|#

;; the segment is conformed by 2 points 
;; which points are conformed of x and y coordinates
;; |
;; |     p    ] 
;; |   /      ] segment
;; | p        ]
;; |___________

;segments
(define (make-segment x y) (cons x y))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s)) 

;points
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; finally
(define (midpoint-segment s)
 (let (
       (pstr (start-segment s))
       (pend (end-segment s))
       )
 (make-point 
   (/ (+ (x-point pstr) (x-point pend)) 2)
   (/ (+ (y-point pstr) (y-point pend)) 2)
   )
 )

)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline)
  )


;should be 2 . 2
(print-point (make-point 1 1))
(print-point (make-point 3 3))

(print
  (midpoint-segment
    (make-segment
      (make-point 1 1)
      (make-point 3 3)
      )
    )
)

(newline)

;should be 8 . 8
(print-point (make-point 4 4))
(print-point (make-point 12 12))

(print
  (midpoint-segment
    (make-segment
      (make-point 4 4)
      (make-point 12 12)
      )
    )
)
