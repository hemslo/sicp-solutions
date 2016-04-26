; Another way to construct an or-gate is as a compound digital logic device,
; built from and-gates and inverters. Define a procedure or-gate that
; accomplishes this. What is the delay time of the or-gate in terms of
; and-gate-delay and inverter-delay?

(define (or-gate a1 a2 output)
  (let ((c1 (make-wire))
        (c2 (make-wire))
        (c3 (make-wire)))
    (inverter a1 c1)
    (inverter a2 c2)
    (and-gate c1 c2 c3)
    (inverter c3 output)))

; delay = and-gate-delay + 2 * inverter-delay
