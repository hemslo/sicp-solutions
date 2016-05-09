; In a similar way to Exercise 3.71 generate a stream of all numbers that can be
; written as the sum of two squares in three different ways (showing how they
; can be so written).

(load "70.scm")

(define (sum-square x) (+ (square (car x)) (square (cadr x))))

(define (sum-square-three-ways s)
  (let ((first (stream-ref s 0))
        (second (stream-ref s 1))
        (third (stream-ref s 2)))
    (if (= (sum-square first) (sum-square second) (sum-square third))
        (cons-stream (sum-square first)
                     (sum-square-three-ways (stream-cdr (stream-cdr (stream-cdr s)))))
        (sum-square-three-ways (stream-cdr s)))))

(define sum-square-three-ways-numbers
  (sum-square-three-ways (weighted-pairs integers integers sum-square)))
