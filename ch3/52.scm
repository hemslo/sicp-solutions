; Consider the sequence of expressions

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream low
                 (stream-enumerate-interval (+ low 1) high))))

(define (display-stream s) (stream-for-each display s))

(define sum 0)
; 0

(define (accum x) (set! sum (+ x sum)) sum)
; 0

(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))
; 1

(define y (stream-filter even? seq))
; 6

(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))
; 10

(stream-ref y 7)
; Value: 136
; 136

(display-stream z)
; 10154555105120190210
; 210

; What is the value of sum after each of the above expressions is evaluated?
; What is the printed response to evaluating the stream-ref and display-stream
; expressions? Would these responses differ if we had implemented (delay ⟨exp⟩)
; simply as (lambda () ⟨exp⟩) without using the optimization provided by
; memo-proc? Explain.

; Yes, recompute accum will cause sum be added multiple times.
