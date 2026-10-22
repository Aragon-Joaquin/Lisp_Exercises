#|
Exercise 2.8: Using reasoning analogous to Alyssa’s, de-
scribe how the difference of two intervals may be com-
puted. Define a corresponding subtraction procedure, called
sub-interval
|#

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (sub-interval x y)
(make-interval 
  (abs (- (lower-bound x) (lower-bound y)))
  (abs (- (upper-bound x) (upper-bound y)))
  ) 
)


(print 
  (sub-interval
  	(make-interval 10 10)
  	(make-interval 4 4)
))

(print 
  (sub-interval
  	(make-interval 2 2)
  	(make-interval 12 12)
))
