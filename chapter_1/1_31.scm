#|
Exercise 1.31:
a) The sum procedure is only the simplest of a vast num-
ber of similar abstractions that can be captured as higher-
order procedures. Write an analogous procedure called
product that returns the product of the values of a
function at points over a given range. Show how to de-
fine factorial in terms of product. Also use product
to compute approximations to π using the formula
π= 2 * 4 * 4 * 6 * 6 * 8 ...
- -----------------------
4  3 * 3 * 5 * 5 * 7 * 7 ...

b. If your product procedure generates a recursive pro-
cess, write one that generates an iterative process. If
it generates an iterative process, write one that gen-
erates a recursive process.
|#

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b)))
)

(define (product_iter term a next b)
  (define (iter k acc)
    (if (> k b) 
      acc
      (iter (next k) (* acc (term k) ))
      )
    )

  (iter a 0)
)

(define (inc k) (+ k 1))

(define (factorial n) 
  (define (term k) k )
  (product term 1 inc n)
)

(define (approx-pi n)
  (define (term k)
    (let ((r (remainder k 2))) ; 1, 2, 3, 4, 5
      (/ (+ k 2 (- r)) ; 2, 4, 4, 6, 6
         (+ k 1 r)))) ; 3, 3, 5, 5, 7
  (* 4 (product term 1.0 inc n)))

; i understand it now... it took me 1h to get it wrong and i had to look the answer. this exercises are explained poorly, or am i dumb
(print (approx-pi 10)) 
