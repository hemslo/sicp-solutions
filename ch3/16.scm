; Ben Bitdiddle decides to write a procedure to count the number of pairs in any
; list structure. “It’s easy,” he reasons. “The number of pairs in any structure
; is the number in the car plus the number in the cdr plus one more to count the
; current pair.” So Ben writes the following procedure:

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

; Show that this procedure is not correct. In particular, draw box-and-pointer
; diagrams representing list structures made up of exactly three pairs for which
; Ben’s procedure would return 3; return 4; return 7; never return at all.

(count-pairs (list 'a 'b 'c))

(define p1 (cons 'a 'b))
(define p2 (cons 'a 'b))
(define p3 (cons p1 p2))
(set-car! p2 p1)
(count-pairs p3)

(define p4 (cons 'a 'b))
(define p5 (cons p4 p4))
(define p6 (cons p5 p5))
(count-pairs p6)

(define pairs (list 'a 'b 'c))
(set-cdr! (cddr pairs) pairs)
(count-pairs pairs)
