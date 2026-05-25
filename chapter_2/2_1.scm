#|
Exercise 2.1: Define a better version of make-rat that han-
dles both positive and negative arguments. make-rat should
normalize the sign so that if the rational number is positive,
both the numerator and denominator are positive, and if
the rational number is negative, only the numerator is neg-
ative.
|#

(define (make-rat n d) 
  (if (negative? d)
    (cons (- n (* n 2)) (abs d))
    (cons n d)
    )
  )

(print "test1: " (make-rat 1 3) )
(print "test2: " (make-rat 1 -3) )
(print "test3: " (make-rat -1 3) )
(print "test4: " (make-rat -1 -3) )
