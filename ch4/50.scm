; Implement a new special form ramb that is like amb except that it searches
; alternatives in a random order, rather than from left to right. Show how this
; can help with Alyssa’s problem in Exercise 4.49.

(define (shuffle l) (sort l (lambda (x y) (= 0 (random 2)))))

(define (ramb? exp) (tagged-list? exp 'ramb))

(define (ramb-choices exp) (shuffle (cdr exp)))

((ramb? exp) (analyze-ramb exp))

(define (analyze-ramb exp)
  (analyze-amb (cons 'amb (ramb-choices exp))))
