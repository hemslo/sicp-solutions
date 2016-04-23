; Devise a correct version of the count-pairs procedure of Exercise 3.16 that
; returns the number of distinct pairs in any structure. (Hint: Traverse the
; structure, maintaining an auxiliary data structure that is used to keep track
; of which pairs have already been counted.)

(define (count-pairs x)
  (let ((counted '()))
    (define (count x)
      (if (or (not (pair? x)) (memq x counted))
          0
          (begin
            (set! counted (cons x counted))
            (+ (count (car x))
               (count (cdr x))
               1))))
  (count x)))
