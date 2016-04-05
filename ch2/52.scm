; Make changes to the square limit of wave shown in Figure 2.9 by working at
; each of the levels described above. In particular:

; a. Add some segments to the primitive wave painter of Exercise 2.49 (to add a
; smile, for example).

; b. Change the pattern constructed by corner-split(for example, by using only
; one copy of the up-split and right-split images instead of two).

; c. Modify the version of square-limit that uses square-of-four so as to
; assemble the corners in a different pattern. (For example, you might make the
; big Mr. Rogers look outward from each corner of the square.)

; a
; skip

; b
(define (corner-split painter n)
  (if (= n 0)
      painter
      (beside (below painter (up-split painter (- n 1)))
              (below (right-split painter (- n 1))
                     (corner-split painter (- n 1))))))

; c
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))
