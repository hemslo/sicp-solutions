; a. Implement the procedure pseudoremainder-terms, which is just like
; remainder-terms except that it multiplies the dividend by the integerizing
; factor described above before calling div-terms. Modify gcd-terms to use
; pseudoremainder-terms, and verify that greatest-common-divisor now produces an
; answer with integer coefficients on the example in Exercise 2.95.

(define (pseudoremainder-terms a b)
  (cadr (div-terms (mul-terms (make-term 0
                                        (expt (coeff (first-term b))
                                              (- (+ 1
                                                    (order (first-term a)))
                                                 (order (first-term b))))))
                    b)))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))

; b. The GCD now has integer coefficients, but they are larger than those of P1.
; Modify gcd-terms so that it removes common factors from the coefficients of
; the answer by dividing all the coefficients by their (integer) greatest common
; divisor.

; can not run
