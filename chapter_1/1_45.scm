#|
Exercise 1.45: We saw in Section 1.3.3 that attempting to
compute square roots by naively finding a fixed point of
y -> x/y does not converge, and that this can be fixed by
average damping. The same method works for finding cube
roots as fixed points of the average-damped y -> x/y^2. Un-
fortunately, the process does not work for fourth roots—a
single average damp is not enough to make a fixed-point
search for y -> x/y^3 converge. On the other hand, if we
average damp twice (i.e., use the average damp of the av-
erage damp of y -> x/y^3) the fixed-point search does con-
verge. Do some experiments to determine how many av-
erage damps are required to compute nth roots as a fixed-
point search based upon repeated average damping of y -> 
x/y^(n-1). Use this to implement a simple procedure for com-
puting nth roots using fixed-point, average-damp, and the
repeated procedure of Exercise 1.43. Assume that any arith-
metic operations you need are available as primitives.
|#


(define (average x y) (/ (+ x y) 2))

;procedures required
(define (repeated f x) 
  (define (compose f g)
    (lambda (x) (f (g x)))
  )
    (define (iter c acc)
      (if (>= c x)
	acc
	(iter (+ c 1) (compose f acc))
	)
      )

    (iter 1 f)
)

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess)
  )

(define (average-damp f)
  (lambda (x) (average x (f x))))


; solution (which i didnt obviouly copied and pasted)
(define (nth-root x n)
  (fixed-point
   ((repeated average-damp
              (floor (/ (log n) (log 2))))
    (lambda (y) (/ x (expt y (- n 1)))))
   1.0))

(print (nth-root 4 2))
(print (nth-root 32 2))
