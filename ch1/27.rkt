#lang sicp

; Demonstrate that the Carmichael numbers listed in Footnote 1.47 really do fool
; the Fermat test. That is, write a procedure that takes an integer n and tests
; whether an is congruent to a modulo n for every a < n, and try your procedure
; on the given Carmichael numbers.

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter a n)
    (if (= a n)
        true
        (if (try-it a)
            (iter (+ 1 a) n)
            false)))
  (iter 1 n))


(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)
