#|
Each of the following two procedures defines
a method for adding two positive integers in terms of the
procedures inc, which increments its argument by 1, and
dec, which decrements its argument by 1.

(define (+ a b)
    (if (= a 0) b (inc (+ (dec a) b))))

(define (+ a b)
    (if (= a 0) b (+ (dec a) (inc b))))

Using the substitution model, illustrate the process gener-
ated by each procedure in evaluating (+ 4 5). Are these
processes iterative or recursive?
|#

(define (inc a) 
    (+ a 1)    
) 

(define (dec a) 
    (- a 1)    
) 

; replaced "+" by "sum" because it generated an infinite loop on inc
(define (sum a b)
    (if (= a 0) b (inc (sum (dec a) b))))

(print (sum 4 5))

; (inc (sum (dec 4) 5)) -> (inc (sum 3 5))
; (inc (inc (sum (dec 3) 5))) -> (inc (inc (sum 2 5)))
; (inc (inc (inc (sum (dec 2) 5)))) -> (inc (inc (inc (sum 1 5))))
; (inc (inc (inc (inc (sum (dec 1) 5))))) -> (inc (inc (inc (inc (sum 0 5)))))
; (inc (inc (inc (inc 5)))) -> (inc (inc (inc 6)))
; (inc (inc (inc 6))) -> (inc (inc 7))
; (inc (inc 7)) -> (inc 8)
; (inc 8) -> 9
; 9

(define (sum2 a b)
    (if (= a 0) b (sum (dec a) (inc b))))

(print (sum2 4 5))

; (sum (dec 4) (inc 5))
; (sum (dec 3) (inc 6))
; (sum (dec 2) (inc 7))
; (sum (dec 1) (inc 8))
; (sum (dec 0) (inc 9)) formal parameter "a" its zero now
; 9

; in conclusion, the first procedure, denominated "sum" in this case, its recursive since it requires
; more stacks with each procedure called, making a pile of (inc a)

; the second procedure it's iterative since it doesn't requires to handle more calculations
; once the (sum2 a b) predicate falls onto the consequent.