#|
The sine of an angle (specified in radians)
can be computed by making use of the approximation sin x ~= x
if x is sufficiently small, and the trigonometric identity
sin x = 3 sin(x/3) - 4sin^3(x/3)

to reduce the size of the argument of sin. (For purposes of
this exercise an angle is considered “sufficiently small” if its
magnitude is not greater than 0.1 radians.) These ideas are
incorporated in the following procedures:

a. How many times is the procedure p applied when (sine
12.15) is evaluated?
b. What is the order of growth in space and number of
steps (as a function of a) used by the process generated
by the sine procedure when (sine a) is evaluated?
|#

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0))))
)


(print (sine 12.15))

; 12.15 > (p (sine 4.05) )
; 4.05 > (p (sine 1.35 ) )
; 1.35 > (p (sine 0.45 ) )
; 0.45 > (p (sine 0.15 ) )
; 0.15 > (p (sine 0.05 ) )
; 0.05 > 0.05

; a) p is applied 5 times

(print (sine 60)) ; testing
; 60 > (p (sine 20))
; 20 > (p (sine 6.66))
; 6.66 > (p (sine 2.22))
; 2.22 > (p (sine 0.74))
; 0.74 > (p (sine 0.2466))
; 0.2466 > (p (sine 0.08))
; 0.08 > 0.08


(print (sine 2)); testing
; 2 > (p (sine 0.66))
; 0.66 > (p (sine 0.22))
; 0.22 > (p (sine 0.07))
; 0.07 > 0.'7

; b) 
;order of growth in space: without Tail Call Optimization, it can be O(log a) since the stack (p procedure calls) grows (not as big as O(a) or as smaller as O(1) as the steps (number of divisions) does

;order of growth in steps: O(log3 a) since we're diving it by 3 each time. making it log3((0.1 / a) * 12.15) ~= log3(121.5) = 4.36 = which rounded up can be 5 (i think)

