; Suppose you are designing a generic arithmetic system for dealing with the
; tower of types shown in Figure 2.25: integer, rational, real, complex. For
; each type (except complex), design a procedure that raises objects of that
; type one level in the tower. Show how to install a generic raise operation
; that will work for each type (except complex)

(define (raise x) (apply-generic 'raise x))

(put 'raise 'integer (lambda (x) (make-rational x 1)))

(put 'raise 'rational (lambda (x) (make-real (/ (numer x) (denom x)))))

(put 'raise 'real (lambda (x) (make-from-real-imag x 0)))
