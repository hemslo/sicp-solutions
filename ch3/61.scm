; Let S be a power series (Exercise 3.59) whose constant term is 1. Suppose we
; want to find the power series 1/S, that is, the series X such that SX = 1.
; Write S = 1 + SR where SR is the part of S after the constant term. Then we
; can solve for X as follows:

; S · X = 1,
; (1+SR)·X =1,
; X + SR · X = 1,
; X =1−SR ·X.

; In other words, X is the power series whose constant term is 1 and whose
; higher-order terms are given by the negative of SR times X. Use this idea to
; write a procedure invert-unit-series that computes 1/S for a power series S
; with constant term 1. You will need to use mul-series from Exercise 3.60.

(define (invert-unit-series s)
  )

; TODO
