#|
    Exercise 1.1: Below is a sequence of expressions. What is
    the result printed by the interpreter in response to each ex-
    pression? Assume that the sequence is to be evaluated in
    the order in which it is presented.
|#

; 10
(print "A) 10")

; (+ 5 3 4)
(print "B) 12")

; (- 9 1)
(print "C) 8")

; (/ 6 2)
(print "D) 3")

; (+ (* 2 4) (- 4 6))
(print "E) 8 + -2 = 6")

; GLOBAL DEFINE = (define a 3)
; GLOBAL DEFINE = (define b (+ a 1))

; (+ a b (* a b))
(print "F) 7 + 12 = 19")

; (= a b)
(print "G) false")

; (if (and (> b a) (< b (* a b)))
; b
; a)
(print "H) if (and true (4 < 12)) = 4")

; (cond ((= a 4) 6)
; ((= b 4) (+ 6 7 a))
; (else 25))
(print "I) cond (= b 4) -> true = 16 ")

; (+ 2 (if (> b a) b a))
(print "J) (+ 2 4 3) = 9")

;(* (cond ((> a b) a)
;((< a b) b)
;(else -1))
;(+ a 1))
(print "K) (* 4 4) = 16")