#|
Exercise 1.16: Design a procedure that evolves an itera-
tive exponentiation process that uses successive squaring
and uses a logarithmic number of steps, as does fast-expt.
(Hint: Using the observation that (b^(n/2))^2 = (b^2)^(n/2), keep,
along with the exponent n and the base b, an additional
state variable a, and define the state transformation in such
a way that the product ab^n is unchanged from state to state.
At the beginning of the process a is taken to be 1, and the
answer is given by the value of a at the end of the process.
In general, the technique of defining an invariant quantity
that remains unchanged from state to state is a powerful
way to think about the design of iterative algorithms.)
|#

(define (is-even? n)
    (= (remainder n 2) 0)
)

(define (square n)
    (* n n)
)

(define (expr b n )
  (expr-iter b n 1)
)


(define (expr-iter b n a) 
    (if (= n 0) 
      a
      (if (is-even? n) 
        (expr-iter
            ( square b )
            (/ n 2)
            a 
          )
        (expr-iter
          b
          ( - n 1 )
          (* a b )
         )
      ) 
    )
) 

(print (expr 2 4)) ; should be  2 * 2 * 2 * 2 = 16
(print (expr 2 5)) ; should be  32
(print (expr 2 6)) ;should be  64
(print (expr 2 2)) ; 4
(print (expr 2 1)) ; 2
(print (expr 2 0)) ; 1
