#|
Exercise 1.5: Ben Bitdiddle has invented a test to determine
whether the interpreter he is faced with is using applicative-
order evaluation or normal-order evaluation. He defines the
following two procedures:

```
(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))
```

Then he evaluates the expression

```
(test 0 (p))
```

What behavior will Ben observe with an interpreter that
uses applicative-order evaluation? What behavior will he
observe with an interpreter that uses normal-order evalu-
ation? Explain your answer. (Assume that the evaluation rule 
for the special form if is the same whether the in-
terpreter is using normal or applicative order: The predi-
cate expression is evaluated first, and the result determines
whether to evaluate the consequent or the alternative ex-
pression.)
|#

; in a Normal order evaluation, it prints 0 since the argument "Y" (bound to the (P) definition) 
; is never evaluated since the Normal Order is a lazy evaluation (they are only evaluated when their value is needed).
; The if condition (= x 0) is true, and thus, returns 0 and the alternative is "skipped".
; In case of "X" being, for example, 1 then the consequent (0) isn't evaluated but the alternative
; causing the infinite recursion.

; Meanwhile, in the Applicative order, it will try to “evaluate the arguments and then apply” forcing 
; an evaluation of ALL arguments before applying the procedure, causing an infinite recursion.
