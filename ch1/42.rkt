#lang sicp

; Let f and д be two one-argument functions. The composition f after g is
; defined to be the function x -> f(g(x )). Define a procedure compose that
; implements composition. For example, if inc is a procedure that adds 1 to its
; argument,
; ((compose square inc) 6) 49

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))

((compose square inc) 6)
