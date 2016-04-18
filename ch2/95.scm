; Define P1, P2, and P3 to be the polynomials
; P1: x^2 − 2x + 1,
; P2: 11x^2 + 7,
; P3: 13x+5.
; Now define Q1 to be the product of P1 and P2 and Q2 to be the product of P1
; and P3, and use greatest-common-divisor (Exercise 2.94) to compute the GCD of
; Q1 and Q2. Note that the answer is not the same as P1. This example introduces
; noninteger operations into the computation, causing difficulties with the GCD
; algorithm.61 To understand what is happening, try tracing gcd-terms while
; computing the GCD or try performing the division by hand.

(define P1 (make-polynomial 'x '((2 1) (1 -2) (0 1))))
(define P2 (make-polynomial 'x '((2 11) (0 7))))
(define P3 (make-polynomial 'x '((1 13) (0 5))))

(define Q1 (mul P1 P2))
(define Q2 (mul P1 P3))

(greatest-common-divisor Q1 Q2)

; can not run
