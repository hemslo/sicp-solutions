; Write a procedure stream-limit that takes as arguments a stream and a number
; (the tolerance). It should examine the stream until it finds two successive
; elements that differ in absolute value by less than the tolerance, and return
; the second of the two elements. Using this, we could compute square roots up
; to a given tolerance by

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess) (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (sqrt-improve guess x) (average guess (/ x guess)))

(define (average x1 x2) (/ (+ x1 x2) 2))


(define (stream-limit s tolerance)
  (let ((second (stream-car (stream-cdr s))))
    (if (< (abs (- (stream-car s) second)) tolerance)
        second
        (stream-limit (stream-cdr s) tolerance))))
