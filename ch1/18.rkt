#lang sicp

; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that
; generates an iterative process for multiplying two integers in terms of
; adding, doubling, and halving and uses a logarithmic number of steps.

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (define (iter a b n)
    (cond ((= b 0) n)
          (even? b) (iter (double a) (halve b) n)
          (else (iter a (- b 1) (+ n a)))))
  (iter a b 0))
