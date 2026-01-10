#|
exercise 1.18: using the results of exercise 1.16 and exer-
cise 1.17, devise a procedure that generates an iterative pro-
cess for multiplying two integers in terms of adding, dou-
bling, and halving and uses a logarithmic number of steps.
|#

(define (is-even? n)
    (= (remainder n 2) 0)
)


(define (double n) 
    ( + n n)
)

(define (halve n)
    ( / n 2 )
)

; its the same as the 1_17 but i did some minor changes
(define (* a b)
    (define (mult_exp a b y)
        (cond 
          ((= b 0) y)
          ((is-even? b) (mult_exp (double a) (halve b) y))
          (else (mult_exp a ( - b 1) (+ y a)) )
        )
    )
    (mult_exp a b 0)
)

(print (* 2 2) )
(print (* 2 5) )
