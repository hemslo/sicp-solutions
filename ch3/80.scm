; Write a procedure RLC that takes as arguments the parameters R, L, and C of
; the circuit and the time increment dt.
; In a manner similar to that of the RC procedure of Exercise 3.73, RLC should
; produce a procedure that takes the initial values of the state variables, vC0
; and iL0 , and produces a pair (using cons) of the streams of states vC and iL.
; Using RLC, generate the pair of streams that models the behavior of a series
; RLC circuit with R = 1 ohm, C = 0.2 farad, L = 1 henry, dt = 0.1 second, and
; initial values iL0 = 0 amps and vC0 =10volts.

(define (RLC r l c dt)
  (lambda (il0 vc0)))

; TODO
