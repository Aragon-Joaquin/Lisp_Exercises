#|
Exercise 2.9: The width of an interval is half of the differ-
ence between its upper and lower bounds. The width is a
measure of the uncertainty of the number specified by the
interval. For some arithmetic operations the width of the
result of combining two intervals is a function only of the
widths of the argument intervals, whereas for others the
width of the combination is not a function of the widths of
the argument intervals. Show that the width of the sum (or
difference) of two intervals is a function only of the widths
of the intervals being added (or subtracted). Give examples
to show that this is not true for multiplication or division.
|#

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (width-interval x)
  (/ (abs (- 
		 (lower-bound x)
		 (upper-bound x)
		))
	 2.0
  ) 
)

(print 
  (width-interval 
    (make-interval 10 22)
    )
)


; ???????

; x = (make-interval 5 10)
; y = (make-interval 2 4)

; (width-interval x) -> 2.5
; (width-interval y) -> 1
; 2.5 + 1 = 3.5 
; OK!

; (width-interval (mult-interval x y)) -> 5*2 - 10*4
; (width-interval 10 40) -> 15
; ?????
