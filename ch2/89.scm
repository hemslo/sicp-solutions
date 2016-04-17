; Define procedures that implement the term-list representation described above
; as appropriate for dense polynomials.

(define (adjoin-term term term-list)
  (if (=zero? (coeff term))
      term-list
      (cons (coeff term) term-list)))

(define (the-empty-termlist) '())

(define (first-term term-list)
  (make-term (car term-list) (- (length term-list) 1)))

(define (rest-terms term-list) (cdr term-list))

(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff) (list order coeff))

(define (order term) (car term))

(define (coeff term) (cadr term))
