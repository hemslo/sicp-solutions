; A continued fraction representation of the tangent function was published in
; 1770 by the German math- ematician J.H. Lambert:
; tan(x) = x / (1 - x ^ 2 / (3 - x ^ 2 / (5 - ...)))
; where x is in radians. Define a procedure (tan-cf x k) that computes an
; approximation to the tangent function based on Lambert’s formula. k specifies
; the number of terms to compute, as in Exercise 1.37.

(load "37.scm")

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= 1 i) x (- (square x))))
             (lambda (i) (- (* 2 i) 1))
             k))
