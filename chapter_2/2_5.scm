#|
Exercise 2.5: Show that we can represent pairs of nonneg-
ative integers using only numbers and arithmetic opera-
tions if we represent the pair a and b as the integer that is
the product 2^a 3^b. Give the corresponding definitions of the
procedures cons, car, and cdr.
|#

;too lazy to think this
(define (cons x y) 
  (* (expt 2 x) (expt 3 y))
)

(define (count-divides a b)
  (define (count a n)
    (let (
		  (q (/ a b))
		  )
      (if (integer? q)
          (count q (+ n 1))
          n
		  )
	  ))
  (count a 0)
)

(define (car z) (count-divides z 2))
(define (cdr z) (count-divides z 3))
