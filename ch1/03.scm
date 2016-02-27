; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of the two larger numbers.

(define (sum-squares-of-two a b)
  (+ (* a a) (* b b)))

(define (sum-squares-of-two-larger a b c)
  (cond ((and (<= a b) (<= a c)) (sum-squares-of-two b c))
        ((and (<= b a) (<= b c)) (sum-squares-of-two a c))
        ((and (<= c a) (<= c b)) (sum-squares-of-two a b))))
