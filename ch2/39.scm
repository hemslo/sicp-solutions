; Complete the following definitions of reverse (Exercise 2.18) in terms of
; fold-right and fold-left from Exercise 2.38:

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
