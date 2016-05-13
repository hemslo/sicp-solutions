; Redo Exercise 3.5 on Monte Carlo integration in terms of streams. The stream
; version of estimate-integral will not have an argument telling how many trials
; to perform. Instead, it will produce a stream of estimates based on
; successively more trials.

(load "56.scm")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream (/ passed (+ passed failed))
                 (monte-carlo (stream-cdr experiment-stream) passed failed)))
   (if (stream-car experiment-stream)
       (next (+ passed 1) failed)
       (next passed (+ failed 1))))

(define (random-number-pair-stream low1 high1 low2 high2)
  (cons-stream (cons (random-in-range low1 high1)
                     (random-in-range low2 high2))
               (random-number-pair-stream low1 high1 low2 high2)))

(define (estimate-integral p x1 x2 y1 y2)
  (let ((area (* (- x2 x1) (- y2 y1)))
        (random-stream (random-number-pair-stream x1 x2 y1 y2)))
    (scale-stream (monte-carlo (stream-map p random-stream) 0 0) area)))
