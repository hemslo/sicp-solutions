; a. Implement this algorithm as a procedurereduce-terms that takes two term
; lists n and d as arguments and returns a list nn, dd, which are n and d
; reduced to lowest terms via the algorithm given above. Also write a procedure
; reduce-poly, analogous to add-poly, that checks to see if the two polys have
; the same variable. If so, reduce-poly strips off the variable and passes the
; problem to reduce-terms, then reattaches the variable to the two term lists
; supplied by reduce-terms.

; b. Define a procedure analogous to reduce-terms that does what the original
; make-rat did for integers:

(define (reduce-integers n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))))

; and define reduce as a generic operation that calls apply-generic to dispatch
; to either reduce-poly (for polynomial arguments) or reduce-integers (for
; scheme number arguments). You can now easily make the rational-arithmetic
; package reduce fractions to lowest terms by having make-rat call reduce before
; combining the given numerator and denominator to form a ratio- nal number. The
; system now handles rational expressions in either integers or polynomials. To
; test your program, try the example at the beginning of this extended exercise:

(define p1 (make-polynomial 'x '((1 1) (0 1))))

(define p2 (make-polynomial 'x '((3 1) (0 -1))))

(define p3 (make-polynomial 'x '((1 1))))

(define p4 (make-polynomial 'x '((2 1) (0 -1))))

(define rf1 (make-rational p1 p2))

(define rf2 (make-rational p3 p4))

(add rf1 rf2)

; See if you get the correct answer, correctly reduced to lowest terms.


; can not run
