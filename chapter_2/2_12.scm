#|
Exercise 2.12: Define a constructor make-center-percent
that takes a center and a percentage tolerance and pro-
duces the desired interval. You must also define a selector
percent that produces the percentage tolerance for a given
interval. The center selector is the same as the one shown
above.
|#

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


;boring
(define (make-center-percent c p)
  (make-center-width 
    c 
    (* c (/ p 100))
))

(define (percent x)
  (* 100 (/ (width x) (center x)))
)
