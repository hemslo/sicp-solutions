; eval uses actual-value rather than eval to evaluate the operator before
; passing it to apply, in order to force the value of the operator. Give an
; example that demonstrates the need for this forcing.

(define (f x) x)

(define (g f x) (f x))

(g f 1)
