; Scheme allows an additional syntax for cond clauses, (⟨test⟩ => ⟨recipient⟩).
; If ⟨test ⟩ evaluates to a true value, then ⟨recipient ⟩ is evaluated. Its
; value must be a procedure of one argument; this procedure is then invoked on
; the value of the ⟨test ⟩, and the result is returned as the value of the cond
; expression. For example
; (cond ((assoc 'b '((a 1) (b 2))) => cadr)
;       (else false))
; returns 2. Modify the handling of cond so that it supports this extended
; syntax.

(define (cond-extended-syntax? clause)
  (eq? (cdar clause) '=>))

(define (expand-clauses clauses)
  (if (null? clauses)
    #f
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clause? first)
          (if (null? rest)
            (sequence->exp (cond-actions first))
            (error "ELSE clause isn't last: COND->IF"
                   clauses))
          (if (cond-extended-syntax? first)
              (make-if (cond-predicate first)
                       (list (caddr first) (cond-predicate first))
                       (expand-clauses rest))
              (make-if (cond-predicate first)
                       (sequence->exp (cond-actions first))
                       (expand-clauses rest)))))))
