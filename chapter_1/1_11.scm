#|
A function f is defined by the rule that (see exercise 1.11)

Write a procedure that computes f by means of a recursive
process. Write a procedure that computes f by means of an
iterative process
|#

;recursion way
(define (recursive n )
  (cond 
    ((< n 3) n)
    (else 
      (
       + (recursive (- n 1)) (* (recursive (- n 2) ) 2) (* (recursive (- n 3) ) 3)
      )
    )
  )
)

(print "Recursive way: ")
; should return 2
(print (recursive 2))

; should return 25
(print (recursive 5))

; should return 11
(print (recursive 4))

; should return 4
(print (recursive 3))

; iterative way
(define (iter-iterative n)
    ( iterative 2 1 0 n )
) 

(define (iterative a b c count)
    (cond ((= count 0 ) c)
    (else 
  (iterative (+ a (* 2 b) (* 3 c)) a b (- count 1))
    )
    )
)

(print "Iterative way: ")
; should return 2
(print (iter-iterative 2))

; should return 25
(print (iter-iterative 5))

; should return 11
(print (iter-iterative 4))

; should return 4
(print (iter-iterative 3))


