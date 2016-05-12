; Generalize the solve-2nd procedure of Exercise 3.78 so that it can be used to
; solve general second-order differential equations d2y/dt2 = f (dy/dt,y).

(load "77.scm")

(define (solve-2nd f a b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (stream-map f dy y))
  y)
