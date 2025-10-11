#|
Exercise 1.3: Define a procedure that takes three numbers
as arguments and returns the sum of the squares of the two
larger numbers.
|#

(define (square x) 
    (* x x))

(define (sum_of_squares a b c)
    (cond 
        ((and (>= a b) (>= c b)) (+ (square a) (square c)))
        ((and (>= b a) (>= c b)) (+ (square b) (square c)))
        (else 
            (+ (square a) (square b)) 
        ) 
    )
)

(print (sum_of_squares 5 4 3)) ; should print 41 = (5*5) + (4*4)