; In order to take a closer look at delayed evaluation, we will use the
; following procedure, which simply returns its argument after printing it:

(define (show x)
  (display x)
  x)

; What does the interpreter print in response to evaluating each expression in
; the following sequence?

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream low
                 (stream-enumerate-interval (+ low 1) high))))

(define x
  (stream-map show
              (stream-enumerate-interval 0 10)))

; (stream-ref x 5)
; 12345
; Value: 5

; (stream-ref x 7)
; 67
; Value: 7
