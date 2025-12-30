#|
The following pattern of numbers is called Pascal’s triangle.
        1
       1 1
      1 2 1
     1 3 3 1
    1 4 6 4 1

The numbers at the edge of the triangle are all 1, and each
number inside the triangle is the sum of the two numbers
above it. Write a procedure that computes elements of
Pascal’s triangle by means of a recursive process.
|#

(define (pascal-iter n)
    (pascal n)
)

(define (pascal n)
    (cond 
      ((= n 0) 1)
      (else (+ (pascal (- n 1) ) (pascal (- n 1) ) ) )
    )
)

; prints the sum of the total row
(print "print the sum of the row")
(print (pascal-iter 4))
(print (pascal-iter 5))
(print (pascal-iter 1))
(print (pascal-iter 2))
(print (pascal-iter 0))


;print per position
(define (pascal-triangle row col)
    (cond 
      ( (> col row) -1)
      ( (or ( = row col) (= col 1 ) ) 1 )
    (else 
        (+ (pascal-triangle  (- row 1) (- col 1)) (pascal-triangle  (- row 1) col))
      )
    )
)

(print "\nprint the number in the row-col specified")
(print (pascal-triangle 1 1)) ;should print 1
(print (pascal-triangle 3 2)) ;should print 2
(print (pascal-triangle 4 3)) ;should print 3
(print (pascal-triangle 5 2)) ;should print 4
(print (pascal-triangle 5 3)) ;should print 6
