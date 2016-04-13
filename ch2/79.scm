; Define a generic equality predicate equ? that tests the equality of two
; numbers, and install it in the generic arithmetic package. This operation
; should work for ordinary numbers, rational numbers, and complex numbers.

(define (install-equ-package)
  (put 'equ?
       '(scheme-number scheme-number)
       =)
  (put 'equ?
       '(rational rational)
       (lambda (x y)
         (= (* (numer x) (denom y))
            (* (numer y) (denom x)))))
  (put 'equ?
       '(complex complex)
       (lambda (x y)
         (and (= (real-part x) (real-part y))
              (= (imag-part x) (imag-part y)))))
  'done)
