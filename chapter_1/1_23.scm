#|
Exercise 1.23: The smallest-divisor procedure shown at
the start of this section does lots of needless testing: After it
checks to see if the number is divisible by 2 there is no point
in checking to see if it is divisible by any larger even num-
bers. This suggests that the values used for test-divisor
should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, ... .

To implement this change, define a procedure next that re-
turns 3 if its input is equal to 2 and otherwise returns its in-
put plus 2. Modify the smallest-divisor procedure to use
(next test-divisor) instead of (+ test-divisor 1).
With timed-prime-test incorporating this modified ver-
sion of smallest-divisor, run the test for each of the 12
primes found in Exercise 1.22. Since this modification halves
the number of test steps, you should expect it to run about
twice as fast. Is this expectation confirmed? If not, what is
the observed ratio of the speeds of the two algorithms, and
how do you explain the fact that it is different from 2?
|#
(import (chicken time))

(define (runtime) 
    (current-process-milliseconds)
)


(define (square n) (* n n))
(define (divides? a b) (= (remainder b a) 0))

(define (next a)
  (cond 
    ((= a 2) 3)
    ((divides? a 2) (+ a 1))
    (else (+ a 2))
  )
)

; defined previously

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


(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test)
  (cond 
    ((> (square test) n) n)
    ((divides? test n) test)
    (else (find-divisor n (next test))) ; the only change lol
    )
)

(define (prime? n)
 ( = n (smallest-divisor n) )
)

; log, again
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


; time csi 1.22 -b (commented all the others exercises)
; real    0m0.038s 
; user    0m0.028s
; sys     0m0.010s

; another test: 
; real    0m0.031s
; user    0m0.022s
; sys     0m0.009s

; vs time csi 1.23 -b
; real    0m0.030s
; user    0m0.026s
; sys     0m0.003s
