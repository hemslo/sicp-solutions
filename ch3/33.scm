; Using primitive multiplier, adder, and constant constraints, define a
; procedure averager that takes three connectors a, b, and c as inputs and
; establishes the constraint that the value of c is the average of the values of
; a and b.

(define (averager a b c)
  (let ((sum (make-connector))
        (count (make-connector)))
    (adder a b sum)
    (multiplier c count sum)
    (constant 2 count)
    'ok))
