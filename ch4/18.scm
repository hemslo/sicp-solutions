; Consider an alternative strategy for scanning out definitions that translates
; the example in the text to

;(lambda ⟨vars⟩
;  (let ((u '*unassigned*) (v '*unassigned*))
;    (let ((a ⟨e1⟩) (b ⟨e2⟩))
;      (set! u a)
;      (set! v b))
;    ⟨e3⟩))

; Here a and b are meant to represent new variable names, created by the
; interpreter, that do not appear in the user’s program. Consider the solve
; procedure from Section 3.5.4:

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

; Will this procedure work if internal definitions are scanned out as shown in
; this exercise? What if they are scanned out as shown in the text? Explain.

; no.

(define (solve f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (let ((a (integral (delay dy) y0 dt))
          (b (stream-map f y))) ; y is '*unassigned
      (set! y a)
      (set! dy b)) ; error
    y))

; correct one

(define (solve f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (set! y (integral (delay dy) y0 dt))
    (set! dy (stream-map f y))
    y))
