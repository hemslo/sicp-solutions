; With power series represented as streams of coefficients as in Exercise 3.59,
; adding series is implemented by add-streams. Complete the definition of the
; following procedure for multiplying series:

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
               (add-streams (add-streams (scale-stream (stream-cdr s1) (stream-car s2))
                                         (scale-stream (stream-cdr s2) (stream-car s1)))
                            (mul-series (stream-cdr s1) (stream-cdr s2)))))

; You can test your procedure by verifying that sin2 x + cos2 x = 1, using the
; series from Exercise 3.59.
