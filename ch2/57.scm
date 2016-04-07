; Extend the differentiation program to han dle sums and products of arbitrary
; numbers of (two or more) terms. Then the last example above could be expressed
; as
; (deriv '(* x y (+ x 3)) 'x)
; Try to do this by changing only the representation for sums and products,
; without changing the deriv procedure at all. For example, the addend of a sum
; would be the first term, and the augend would be the sum of the rest of the
; terms.

(load "56.scm")

(define (augend s) (fold make-sum 0 (cddr s)))

(define (multiplicand p) (fold make-product 1 (cddr p)))
