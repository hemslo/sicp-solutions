; Louis Reasoner wants to build a squarer, a constraint device with two
; terminals such that the value of connector b on the second terminal will
; always be the square of the value a on the first terminal. He proposes the
; following simple device made from a multiplier:

(define (squarer a b)
  (multiplier a a b))

; There is a serious flaw in this idea. Explain.

; (set-value! b 9 'user) doesn't work, a is not computed.
