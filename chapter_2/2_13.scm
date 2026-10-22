#|
Exercise 2.13: Show that under the assumption of small
percentage tolerances there is a simple formula for the ap-
proximate percentage tolerance of the product of two in-
tervals in terms of the tolerances of the factors. You may
simplify the problem by assuming that all numbers are pos-
itive.
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

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-center-percent c p)
  (make-center-width 
    c 
    (* c (/ p 100))
))

(define (percent x)
  (* 100 (/ (width x) (center x)))
)

; i tried this one, i still dont get it
(print 
  (percent
  (mul-interval 
    (make-center-percent 30 1)
    (make-center-percent 25 3)
    )
  )
  )
