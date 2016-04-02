; Write a procedure to find all ordered triples of distinct positive integers
; i, j, and k less than or equal to a given integer n that sum to a given
; integer s.

(define accumulate fold-right)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                       (map (lambda (k) (list i j k))
                            (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (ordered-sum-triples n s)
  (filter (lambda (triple) (= (accumulate + 0 triple) s))
          (unique-triples n)))
