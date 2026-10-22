#|
Exercise 2.11: In passing, Ben also cryptically comments:
“By testing the signs of the endpoints of the intervals, it is
possible to break mul-interval into nine cases, only one
of which requires more than two multiplications.” Rewrite
this procedure using Ben’s suggestion.
|#

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))


(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond 
      ((> x1 0)
           (cond ((> y1 0) (make-interval (* x1 y1) (* x2 y2)))
                 ((< y2 0) (make-interval (* x2 y1) (* x1 y2)))
                 (else (make-interval (* x2 y1) (* x2 y2)))
                 ))
          ((< x2 0)
           (cond ((> y1 0) (make-interval (* x1 y2) (* x2 y1)))
                 ((< y2 0) (make-interval (* x2 y2) (* x1 y1)))
                 (else (make-interval (* x1 y2) (* x1 y1)))
                 ))
          (else
           (cond ((> y1 0) (make-interval (* x1 y2) (* x2 y2)))
                 ((< y2 0) (make-interval (* x2 y1) (* x1 y1)))
                 (else (make-interval (min (* x1 y2) (* x2 y1))
                                      (max (* x1 y1) (* x2 y2)))))))
    )
  )

(print 
  (mul-interval 
    (make-interval 10 10)
    (make-interval 0 --2)
    )
  )
