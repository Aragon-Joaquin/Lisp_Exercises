#|
Exercise 1.7: The good-enough? test used in computing
square roots will not be very effective for finding the square
roots of very small numbers. Also, in real computers, arith-
metic operations are almost always performed with lim-
ited precision. This makes our test inadequate for very large
numbers. Explain these statements, with examples showing
how the test fails for small and large numbers.

An alternative strategy for implementing good-enough? 
is to watch how guess changes from one iteration to the next and to
stop when the change is a very small fraction of the guess.
Design a square-root procedure that uses this kind of end
test. Does this work better for small and large numbers?
|#

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


; small number
(print (good-enough? 1.4143999 2))  ; should be 1.4142 - returns true 
(print (good-enough? 0.99967 1))    ; should be 1 - returns true

; big numbers
(print (good-enough? 1e7 1e14 ))
(print (good-enough? 35136.41828 1234567890)) ; it throws false even though its correct

; it loses precision on small numbers thanks to its arbitrary tolerance which
; causes to return a invalid root square
; meanwhile the big numbers it requires the procedure to be executed multiple times
; because of the exact precision needed to be true 

(print "defining a new square-root procedure ->"):

; i wont be pasting any code that i don't understand
; so heres, the result :) https://mk12.github.io/sicp/exercise/1/1.html#1.1.7.