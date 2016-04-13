; Define a generic predicate =zero? that tests if its argument is zero, and
; install it in the generic arithmetic package. This operation should work for
; ordinary numbers, rational numbers, and complex numbers.

(define (install-equ-package)
  (put '=zero?
       '(scheme-number)
       (lambda (x) (= a 0)))
  (put '=zero?
       '(rational)
       (lambda (x)
         (= (numer x) 0)))
  (put '=zero?
       '(complex)
       (lambda (x)
         (= (real-part x) (imag-part x) 0)))
  'done)
