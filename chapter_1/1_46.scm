#|
Exercise 1.46: Several of the numerical methods described
in this chapter are instances of an extremely general com-
putational strategy known as iterative improvement. Itera-
tive improvement says that, to compute something, we start
with an initial guess for the answer, test if the guess is good
enough, and otherwise improve the guess and continue the
process using the improved guess as the new guess. Write
a procedure iterative-improve that takes two procedures
as arguments: a method for telling whether a guess is good
enough and a method for improving a guess. iterative-
improve should return as its value a procedure that takes a
guess as argument and keeps improving the guess until it is
good enough. Rewrite the sqrt procedure of Section 1.1.7
and the fixed-point procedure of Section 1.3.3 in terms of
iterative-improve.
|#


;NOTE: another failure for me... its been a time since then
(define (iterative-improve eng imp)
  (define (iter g)
    (if (eng g)
      g
      (iter (imp g))
      )
    )
  iter
)

(define tolerance 0.001)

(define (sqrt2 x)
  (define (average x y) (/ (+ x y) 2.0))
  (define (square x) (* x x))

  (
   (iterative-improve
    (lambda (g) (< (abs (- (square g) x)) tolerance))
    (lambda (g) (average g (/ x g)))
    )
   1.0
   )
)

(define (fixed-point f first-guess)
  (
   (iterative-improve
    (lambda (g) (< (abs (- g (f g ))) tolerance)) 
    f
    )
   first-guess)
  )

(print (sqrt2 256.0))
(print (fixed-point cos 2.0))
