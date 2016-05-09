; Numbers that can be expressed as the sum of two cubes in more than one way are
; sometimes called Ramanujan numbers, in honor of the mathematician Srinivasa
; Ramanujan. Ordered streams of pairs provide an elegant solution to the problem
; of computing these numbers. To find a number that can be written as the sum of
; two cubes in two different ways, we need only generate the stream of pairs of
; integers (i, j) weighted according to the sum i3 + j3 (see Exercise 3.70),
; then search the stream for two consecutive pairs with the same weight. Write a
; procedure to generate the Ramanujan numbers. The first such number is 1,729.
; What are the next five?

(load "70.scm")

(define (cube x) (* x x x))

(define (sum-cube x) (+ (cube (car x)) (cube (cadr x))))

(define (ramanujan s)
  (let ((first (stream-ref s 0))
        (second (stream-ref s 1)))
    (if (= (sum-cube first) (sum-cube second))
        (cons-stream (sum-cube first)
                     (ramanujan (stream-cdr (stream-cdr s))))
        (ramanujan (stream-cdr s)))))

(define ramanujan-numbers
  (ramanujan (weighted-pairs integers integers sum-cube)))

; 4104 13832 20683 32832 39312
