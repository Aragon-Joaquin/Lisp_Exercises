#|Exercise 1.26: Louis Reasoner is having great difficulty do-
ing Exercise 1.24. His fast-prime? test seems to run more
slowly than his prime? test. Louis calls his friend Eva Lu
Ator over to help. When they examine Louis’s code, they
find that he has rewritten the expmod procedure to use an
explicit multiplication, rather than calling square:

(define (expmod base exp m)
    (cond 
        ((= exp 0) 1)
        ((even? exp)
            (remainder (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) m)
        )
        (else (remainder (* base (expmod base (- exp 1) m)) m))
    )
)

“I don’t see what difference that could make,” says Louis.
“I do.” says Eva. “By writing the procedure like that, you
have transformed the Θ(log n) process into a Θ(n) process.”
Explain.
|#

; lets suppose we have this case, where we're calling the expmod procedure with the following arguments:
; (exp 2 4 4) 
; its first loop would ending up spawning TWO procedure calls, meaning we're doing the double of jobs

; (exp 2 4 4) -> (* (exp 2 2 4) (exp 2 2 4) )
; which these two would exponentially grow like this:

; (exp 2 2 4) -> (* (exp 2 1 4) (exp 2 1 4) )
; (exp 2 2 4) -> (* (exp 2 1 4) (exp 2 1 4) )

; (exp 2 1 4) -> (exp 2 0 4) -> 1
; (exp 2 1 4) -> (exp 2 0 4) -> 1
; (exp 2 1 4) -> (exp 2 0 4) -> 1
; (exp 2 1 4) -> (exp 2 0 4) -> 1

; instead of making the double of the computation and overflowing the stack, we can compute a simple O(1) multiplication of 
; the result by calling the procedure (square n) and we dont cancel out the optimization we've made
