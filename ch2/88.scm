; Extend the polynomial system to include subtraction of polynomials. (Hint: You
; may find it helpful to define a generic negation operation.)

(put 'negate
     'scheme-number
     (lambda (x) (tag (- x))))

(put 'negate
     'rational
     (lambda (x) (make-rational (- (numer x)) (denom x))))

(put 'negate
     'complex
     (lambda (x) (make-from-real-imag (- (real-part x)) (- (imag-part x)))))

(put 'negate
     'polynomial
     (lambda (x)
       (make-polynomial (variable x)
                        (map (lambda (t) (make-term (order t)
                                                    (negate (coeff t))))
                             (term-list x)))))

(put 'sub
     '(polynomial polynomial)
     (lambda (x y) (add-poly x (negete y))))
