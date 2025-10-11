#|
Exercise 1.4: Observe that our model of evaluation allows
for combinations whose operators are compound expres-
sions. Use this observation to describe the behavior of the
following procedure:

```
(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))
```
|#

; we get to define a procedure, more known as a Function in most programming languages which accepts TWO formal parameters
; the objective of this procedure is to return the sum of "A" (1° parameter) and the absolute (always positive number) of "B" (2° parameter).
; if the condition of "B" is greater than 0 then we determine that "B" isn't a negative integer, so then we do the usual 
; arithmetic of (+ a b), or "A" + "B" in a more mathematical mean, to get our desired result.
; if "B" ISN'T greater than 0, its likely to be a negative number (- b), so we assign the - (minus sign) instead of the + (plus) 
; so the operation becomes (- a (- b)), or represented as "A" - (-"B") mathematically to then apply the double negative rule
; transforming -"B" into "B", which the operation is finally interpreted as (+ a b) or "A" + "B".

; In all the cases the operation its treated as "A" + |"B"| being "B" treated as an absolute number since it cannot be negative in any case
; thanks to the previous validations