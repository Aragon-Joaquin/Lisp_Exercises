#|
Exercise 1.27: Demonstrate that the Carmichael numbers
listed in Footnote 1.47 really do fool the Fermat test. That is,
write a procedure that takes an integer n and tests whether
an is congruent to a modulo n for every a < n, and try your
procedure on the given Carmichael numbers.
|#

(import (chicken random))

(define (randomDefine n)
    (pseudo-random-integer n)
)

(define (square n) 
    (* n n)
)

;fermat test
(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))
    )
)

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a)
    )

    (try-it (+ 1 (randomDefine n)))
)

(define (fast-prime? n times)
    (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)
    )
)


; carmichael numbers:

(print "is 5 a prime number? (YES): " (fermat-test 5))
(print "is 13 a prime number? (YES): " (fermat-test 13))
(print "is 61 a prime number? (YES): " (fermat-test 61))

(print "is 100 a prime number? (NO): " (fermat-test 100))
(print "is 27 a prime number? (NO): " (fermat-test 27))
(print "is 55 a prime number? (NO): " (fermat-test 55))



; 561, 1105, 1729, 2465, 2821, 6601
(print "\n")
(print "is 561 a prime number? (its not): " (fermat-test 561))
(print "is 1105 a prime number? (its not): " (fermat-test 1105))
(print "is 1729 a prime number? (its not): " (fermat-test 1729))
(print "is 2465 a prime number? (its not): " (fermat-test 2465))
(print "is 2821 a prime number? (its not): " (fermat-test 2821))
(print "is 6601 a prime number? (its not): " (fermat-test 6601))
