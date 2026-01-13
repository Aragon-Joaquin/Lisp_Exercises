#|
Exercise 1.19: There is a clever algorithm for computing
the Fibonacci numbers in a logarithmic number of steps.
Recall the transformation of the state variables a and b in
the fib-iter process of Section 1.2.2: a <- a + b and b <- a.
Call this transformation T , and observe that applying T
over and over again n times, starting with 1 and 0, produces
the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci
numbers are produced by applying T^n , the n^th power of the
transformation T, starting with the pair (1, 0). Now consider
T to be the special case of p = 0 and q = 1 in a family of
transformations T_{pq}, where T_{pq} transforms the pair (a, b)
according to a <- bq + aq + ap and b <- bp + aq. Show
that if we apply such a transformation T_{pq} twice, the effect
is the same as using a single transformation T_{p′q′} of the
same form, and compute p′ and q′ in terms of p and q. This
gives us an explicit way to square these transformations,
and thus we can compute T^n using successive squaring, as
in the fast-expt procedure. Put this all together to com-
plete the following procedure, which runs in a logarithmic
number of steps
|#


; i copied this solution cuz this is insane. 
; i've readed a ton of times and i dont understand how p and q needs to increment through each iteration

(define (square x) (* x x))

(define (fib n)
  (print "INIT--------------------------------------------")
    (fib-iter 1 0 0 1 n)
)

(define (fib-iter a b p q count)
  (print "pre-process:") 
  (print "a: " a) 
  (print "b: " b) 
  (print "p: " p) 
  (print "q: " q) 
  (print "count: " count "\n") 
    (cond ((= count 0) b)
        ((even? count)
            (fib-iter 
                a
                b
                (+ (square p) (square q))
                (+ (square q) (* 2 p q))
            (/ count 2))
        )
        (else (fib-iter 
                ( + 
                  (* b q) 
                  (* a q) 
                  (* a p)
                )
                ( + 
                  (* b p) 
                  (* a q)
                ) 
                p q
                (- count 1))
        )
    )
)

; 0 1 1 2 3 5 7 13
(print (fib 7)) ; 13
(print (fib 5)) ; 5
(print (fib 2)) ; 1
(print (fib 4)) ; 3
