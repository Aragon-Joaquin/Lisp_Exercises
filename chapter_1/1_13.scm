#|
Prove that Fib(n) is the closest integer to
ϕn /p5, where ϕ = (1 + p5)/2. Hint: Let ψ = (1 - p5)/2.
Use induction and the definition of the Fibonacci numbers
(see Section 1.2.2) to prove that Fib(n) = (ϕn  ψ n )/p5
|#

(define phi 1.618) ; ϕ
(define psi -0.618) ; ψ 


; n = number, t = times. 2^3 = 8
(define (power-iter n t)
  (power n t 0)
)

(define (power n t c)
   (if
     (>= c t) 1
     (* n (power n t (+ c 1)) ) 
    )
)

(define (prove n)
  (round
    ( /
        ( -
            (round (power-iter phi n))
            (round (power-iter psi n)) 
        )
    (sqrt 5)
    )
    )
)

(print (prove 5)) ; 5~
(print (prove 6)) ; 8~
(print (prove 7)) ; 13~
(print (prove 3)) ; 2~
