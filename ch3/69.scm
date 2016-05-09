; Write a procedure triples that takes three infinite streams, S , T , and U ,
; and produces the stream of triples(Si,Tj,Uk) such that i ≤ j ≤ k. Use triples
; to generate the stream of all Pythagorean triples of positive integers, i.e.,
; the triples (i, j, k) such that i ≤ j and i2 + j2 = k2.

(load "66.scm")

(define (triples s t u)
  (cons-stream (list (stream-car s) (stream-car t) (stream-car u))
               (interleave (stream-map (lambda (x) (cons (stream-car s) x))
                                       (stream-cdr (pairs t u)))
                           (triples (stream-cdr s)
                                    (stream-cdr t)
                                    (stream-cdr u)))))

(define pythagorean
  (stream-filter (lambda (x) (= (square (caddr x))
                                (+ (square (car x))
                                   (square (cadr x)))))
                 (triples integers integers integers)))
