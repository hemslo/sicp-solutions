; Implement Monte Carlo integration as a procedure estimate-integral that takes
; as arguments a predicate P, upper and lower bounds x1, x2, y1, and y2 for the
; rectangle, and the number of trials to perform in order to produce the
; estimate. Your procedure should use the same monte-carlo procedure that was
; used above to estimate π . Use your estimate-integral to produce an estimate
; of π by measuring the area of a unit circle.

; You will find it useful to have a procedure that returns a number chosen at
; random from a given range. The following random-in-range procedure implements
; this in terms of the random procedure used in Section 1.2.6, which returns a
; nonnegative number less than its input.

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else (iter (- trials-remaining 1)
                      trials-passed))))
  (iter trials 0))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (monte-carlo trials
               (lambda () (P (random-in-range x1 x2)
                             (random-in-range y1 y2)))))
