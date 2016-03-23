; In passing, Ben also cryptically comments: “By testing the signs of the
; endpoints of the intervals, it is possible to break mul-interval into nine
; cases, only one of which requires more than two multiplications.” Rewrite this
; procedure using Ben’s suggestion.

(load "07.scm")

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Ben's suggestion is to detect 9 cases of sign combination, which has too many
; condition clauses, the cyclomatic complexity is too high, the original one is
; better.
