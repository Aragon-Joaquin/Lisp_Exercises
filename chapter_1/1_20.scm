#|
Exercise 1.20: The process that a procedure generates is
of course dependent on the rules used by the interpreter.
As an example, consider the iterative gcd procedure given
above. Suppose we were to interpret this procedure using
normal-order evaluation, as discussed in Section 1.1.5. (The
normal-order-evaluation rule for if is described in Exercise
1.5.) Using the substitution method (for normal order), illus-
trate the process generated in evaluating (gcd 206 40) and
indicate the remainder operations that are actually per-
formed. How many remainder operations are actually per-
formed in the normal-order evaluation of (gcd 206 40)?
In the applicative-order evaluation?
|#

(define (gcd a b)
    (if (= b 0)
    a
    (gcd b (remainder a b)))
)

(print (gdc 206 40))

; ---------------------------------------------------------------------------------
; normal order, each time b is called the (remainder) procedure is called

; 1) a=206, b=40 > (gcd 40 (remainder 206 40))
; 2) a=40 b=(remainder 206 40) -> b needs to be checked THRICE
; it would look like this:

;(define (gcd 40 (remainder 206 40))
;   (if (= (remainder 206 40) 0)
;    a ; wont reach here
;    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;)

;3) a=6 b=(remainder 40 6) -> b needs to be checked THRICE
;4) a=4 b=(remainder 6 4) -> b needs to be checked THRICE
;5) a=2 b=(remainder 4 2) -> b needs to be checked ONCE

;(define (gcd 2 (remainder 4 2))
;   (if (= (remainder 4 2) 0) ; b = 0
;   2 
;    (gcd b (remainder a b)) ;wont reach here
;)

;6) recursion ends.

; so in total, it would require (3 * 4) - 2
; -2 since the last call didnt cause another recursion. 
; that would be 10 times that the procedure (remainder) has been performed!

; ---------------------------------------------------------------------------------

; applicative order. procedure arguments are validated BEFORE the procedure starts
; 1) a=206, b=40 > (gcd 40 (remainder 206 40))
; 2) a=40, b=6 > (gcd 6 (remainder 40 6))

; (define (gcd 40 6)
;     (if (= 6 0)
;     40
;     (gcd 6 (remainder 40 6)))
; )

; 3) a=6, b=4 > (gcd 4 (remainder 6 4))
; 4) a=4, b=2 > (gcd 2 (remainder 4 2))
; 5) a=2, b=0
; recursion ends

;in this order, as we can see, its only evaluted 4 times! cool :)

