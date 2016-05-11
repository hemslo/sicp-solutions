; Write a procedure RC that models this circuit. RC should take as inputs the
; values of R, C, and dt and should return a procedure that takes as inputs a
; stream representing the current i and an initial value for the capacitor
; voltage v0 and produces as output the stream of voltages v. For example, you
; should be able to use RC to model an RC circuit with R = 5 ohms, C = 1 farad,
; and a 0.5-second time step by evaluating (define RC1 (RC 5 1 0.5)). This
; defines RC1 as a procedure that takes a stream representing the time sequence
; of currents and an initial capacitor voltage and produces the output stream of
; voltages.

(load "56.scm")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC r c dt)
  (lambda (i v)
    (add-streams (scale-stream i r)
                 (integral (scale-stream i (/ 1 c)) v dt))))
