; Suppose we want to handle complex numbers whose real parts, imaginary parts,
; magnitudes, and angles can be either ordinary numbers, rational numbers, or
; other numbers we might wish to add to the system. Describe and implement the
; changes to the system needed to accommodate this. You will have to define
; operations such as sine and cosine that are generic over ordinary numbers and
; rational numbers.

(define (add-complex z1 z2)
  (make-from-real-imag (add (real-part z1) (real-part z2))
                       (add (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-imag (sub (real-part z1) (real-part z2))
                       (sub (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (mul (magnitude z1) (magnitude z2))
                     (add (angle z1) (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (div (magnitude z1) (magnitude z2))
                     (sub (angle z1) (angle z2))))

(put 'sine 'scheme-number (lambda (x) (tag (sin x))))
(put 'cosine 'scheme-number (lambda (x) (tag (cos x))))

(put 'sine 'rational (lambda (x) (tag (sine (/ (numer x) (denom x))))))
(put 'cosine 'rational (lambda (x) (tag (cosine (/ (numer x) (denom x))))))
