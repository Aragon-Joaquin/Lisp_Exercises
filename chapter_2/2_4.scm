#|
Exercise 2.4: Here is an alternative procedural representa-
tion of pairs. For this representation, verify that (car (cons
x y)) yields x for any objects x and y.

(define (cons x y)
  (lambda (m) (m x y))
)

(define (car z)
  (z (lambda (p q) p))
)

What is the corresponding definition of cdr? (Hint: To ver-
ify that this works, make use of the substitution model of
Section 1.1.5.)
|#

(define (cons x y)
  (lambda (m) (m x y))
)

(define (car z)
  (z (lambda (p q) p))
)

;z expands to (lambda (m) (m x y))
;which makes it (lambda (procedure) (procedure x y))
; which the procedure is (lambda (p q) p)
(print "car value: " (car (cons 1 2)))


(define (cdr z)
  (z (lambda (_ q) q))
)

(print "cdr value: " (cdr (cons 1 2)))


