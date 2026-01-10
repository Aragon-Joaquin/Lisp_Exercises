#|
Exercise 1.17: The exponentiation algorithms in this sec-
tion are based on performing exponentiation by means of
repeated multiplication. In a similar way, one can perform
integer multiplication by means of repeated addition. The
following multiplication procedure (in which it is assumed
that our language can only add, not multiply) is analogous
to the expt procedure:

(define (* a b)
(if (= b 0)
0
(+ a (* a (- b 1)))))

This algorithm takes a number of steps that is linear in b.
Now suppose we include, together with addition, opera-
tions double, which doubles an integer, and halve, which
divides an (even) integer by 2. Using these, design a mul-
tiplication procedure analogous to fast-expt that uses a
logarithmic number of steps.
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

(define (* a b)
    (mult_exp a b 0)
)


;improve this. its logarithmic on steps and linear on depth at least :P
; (define (mult_exp a b Y)
;     (if (= b 0)
;         Y
;         (if (> (- b 2) 0)
;             (mult_exp 
;               a 
;               (- b 2) 
;               (+ Y a a)
;             )
;             (mult_exp
;                 a
;                 ( - b 1)
;                 (+ Y a)
;               )
;         )
;     )
; )
;

(define (mult_exp a b Y)
    (if (= b 0)
        Y
        (if (is-even? b)
            (mult_exp 
              (double a) 
              (halve b) 
              Y
            )
            (mult_exp
                a
                ( - b 1)
                (+ Y a)
              )
        )
    )
)

(print (* 2 2 ) ); 4
(print (* 5 5 ) ); 25
(print (* 10 10 ) ); 100
(print (* 100 100 ) ); 10_000
(print (* 1 1 ) ); 1
(print (* 1 0 ) ); 0
