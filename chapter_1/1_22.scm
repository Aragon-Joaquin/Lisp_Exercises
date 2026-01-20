#|
Exercise 1.22: Most Lisp implementations include a prim-
itive called runtime that returns an integer that specifies
the amount of time the system has been running (mea-
sured, for example, in microseconds). The following timed-
prime-test procedure, when called with an integer n, prints
n and checks to see if n is prime. If n is prime, the procedure
prints three asterisks followed by the amount of time used
in performing the test.

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
    )
)

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
)

Using this procedure, write a procedure search-for-primes
that checks the primality of consecutive odd integers in a
specified range. Use your procedure to find the three small-
est primes larger than 1000; larger than 10,000; larger than
100,000; larger than 1,000,000. Note the time needed to test
each prime. Since the testing algorithm has order of growth
of Θ(sqrt(n)), you should expect that testing for primes around
10,000 should take about sqrt(10) times as long as testing for
primes around 1000. Do your timing data bear this out?
How well do the data for 100,000 and 1,000,000 support the
Θ(sqrt(n)) prediction? Is your result compatible with the notion
that programs on your machine run in time proportional to
the number of steps required for the computation?
|#

(import (chicken time))

(define (runtime) 
    (current-process-milliseconds)
)

; solution
(define (is-odd? n)
( = (remainder n 2) 0)
)

(define (square n) 
(* n n)
)

(define (three-smallest-primes n ) 
  (three-iter n 3)
)

(define (three-iter n times-found)
    (cond 
        ((= times-found 0) (newline) )
        ((prime? n)
         (timed-prime-test n) 
         (three-iter (+ n 1) (- times-found 1))
         )
        (else (three-iter (+ n 1) times-found))
    )
)

; not mine
(define (search-for-primes left right)
  (define (iter left)
    (timed-prime-test left)
    (if (>= left right)
        (newline)
        (iter (+ left 2))))
  (iter left)
)

;defined funcs
(define (divides? a b)
    (= (remainder b a ) 0)
)

 ; up to sqrt(n)
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

; logger
(define (timed-prime-test n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time) n)
    )
)

(define (report-prime elapsed-time n)
    (print "tested: " n)
    (print " *** " elapsed-time "ms *** ")
)

; print
(print "1000: " (three-smallest-primes 1000))
(newline)
(print "10_000: " (three-smallest-primes 10000))
(newline)
(print "100_000: " (three-smallest-primes 100000))
(newline)
(print "1_000_000: " (three-smallest-primes 1000000))
(newline)


(print "search-primes")
(search-for-primes 1001 1019)
(search-for-primes 10001 10037)
(search-for-primes 100001 100043)
(search-for-primes 1000001 1000037)

(search-for-primes 1000000001 1000000021)
(search-for-primes 10000000001 10000000061)
(search-for-primes 100000000001 100000000057)
(search-for-primes 1000000000001 1000000000063)
