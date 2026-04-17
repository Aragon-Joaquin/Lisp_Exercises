#|
Exercise 1.34: Suppose we define the procedure

(define (f g) (g 2))
Then we have

(f square)
4

(f (lambda (z) (* z (+ z 1))))
6

What happens if we (perversely) ask the interpreter to eval-
uate the combination (f f)? Explain.
|#

(define (f g) (g 2))


(print "Square: " (f (lambda (z) (* z z))))

(print "Lambda: " (f (lambda (z) (* z (+ z 1)))))

(print "Crashes: " (f f) )
; err: call of non-procedure: 2
; the stacks goes like this:

; (f f) 
; (f (f 2)
; (f (f (2 2)))
; it recieves 2 as a procedure with the argument 2. its invalid.
