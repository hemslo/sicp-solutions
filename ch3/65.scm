; Use the series
; ln 2 = 1 − 1/2 + 1/3 − 1/4 + . . .
; to compute three sequences of approximations to the natural logarithm of 2, in
; the same way we did above for π. How rapidly do these sequences converge?

(load "54.scm")
(load "55.scm")
(load "56.scm")

(define (ln2-summands n)
  (cons-stream (/ 1.0 n) (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

;(display-stream ln2-stream)

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

; (display-stream (euler-transform ln2-stream))

(define (make-tableau transform s)
  (cons-stream s (make-tableau transform (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car (make-tableau transform s)))

; (display-stream (accelerated-sequence euler-transform ln2-stream))
