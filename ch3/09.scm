; In Section 1.2.1 we used the substitution model to analyze two procedures for
; computing factorials, a recursive version

; (define (factorial n)
; (if (= n 1) 1 (* n (factorial (- n 1)))))

; and an iterative version
; (define (factorial n) (fact-iter 1 1 n))
; (define (fact-iter product counter max-count)
;  (if (> counter max-count) product
;      (fact-iter (* counter product)
;                 (+ counter 1)
;                 max-count)))

; Show the environment structures created by evaluating (factorial 6) using each
; version of the factorial procedure.

; 1.
; e1 n: 6
; e2 n: 5
; e3 n: 4
; e4 n: 3
; e5 n: 2
; e6 n: 1

; 2.
; e1 product: 1 counter: 1 max-count: 6
; e2 product: 1 counter: 2 max-count: 6
; e3 product: 2 counter: 3 max-count: 6
; e4 product: 6 counter: 4 max-count: 6
; e5 product: 24 counter: 5 max-count: 6
; e6 product: 120 counter: 6 max-count: 6
; e7 product: 720 counter: 7 max-count: 6
