; Install =zero? for polynomials in the generic arithmetic package. This will
; allow adjoin-term to work for polynomials with coefficients that are
; themselves polynomials.

(put '=zero?
     'polynomial
     (lambda (x) (empty-termlist? (term-list x))))
