#|
Exercise 1.33: You can obtain an even more general ver-
sion of accumulate (Exercise 1.32) by introducing the no-
tion of a filter on the terms to be combined. That is, combine
only those terms derived from values in the range that sat-
isfy a specified condition. The resulting filtered-accumulate
abstraction takes the same arguments as accumulate, to-
gether with an additional predicate of one argument that
specifies the filter. Write filtered-accumulate as a proce-
dure. Show how to express the following using filtered-
accumulate:
a. the sum of the squares of the prime numbers in the
interval a to b (assuming that you have a prime? pred-
icate already written)
b. the product of all the positive integers less than n that
are relatively prime to n (i.e., all positive integers i < n
such that GCD(i, n) = 1).
|#

; i need to make modules to stop doing this...
(define (square n) (* n n))

(define (divides? a b) (= (remainder b a ) 0) )

(define (find-divisor n test)
  (cond 
    ((> (square test) n) n)
    ((divides? test n) test)
    (else (find-divisor n (+ test 1)))
    )
)
(define (prime? n)
 ( = n (find-divisor n 2) )
)

;filter-accumulate in recursive form... i think its good
(define (facc combiner null-value term a next b filter)
  (cond ((> a b) null-value)
	((not (filter a)) 
         (facc combiner null-value term (next a) next b filter))
	(else
	  (combiner (term a)
		    (facc combiner null-value term (next a) next b filter))
	)
  )	
)


(define (next k) (+ k 1))
(define (identity k) k)

; a)
(define (sum_square a b)
  (define (combiner k nv) ( + k nv) )  
  (facc combiner 0 square a next b prime?)
)

(define (positive_integers a)
  (define (combiner k nv) ( * k nv) )  

  (define (filter k) 
    (= (gcd k a) 1)
  )

  (facc combiner 1 identity 1 next ( - a 1 ) filter)
)
