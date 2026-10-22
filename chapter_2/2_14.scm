#|
Exercise 2.14: Demonstrate that Lem is right. Investigate
the behavior of the system on a variety of arithmetic ex-
pressions. Make some intervals A and B, and use them in
computing the expressions A/A and A/B. You will get the
most insight by using intervals whose width is a small per-
centage of the center value. Examine the results of the com-
putation in center-percent form (see Exercise 2.12).
|#

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))


(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (make-center-percent c p)
  (make-center-width 
    c 
    (* c (/ p 100))
))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent x)
  (* 100 (/ (width x) (center x)))
)

; lem solution
(define (par1 r1 r2)
  (div-interval 
    (mul-interval r1 r2)
    (add-interval r1 r2))
)

(define (par2 r1 r2)
  (let 
    ((one (make-interval 1 1)))
    (div-interval 
      one 
      (add-interval 
        (div-interval one r1)
        (div-interval one r2)
        )
      )
    )
  )

; tests
(define r1 (make-center-percent 500 5))
(define r2 (make-center-percent 500 5))

(print (percent (par1 r1 r2)))
(print (percent (par2 r1 r2)))
