; let expressions are derived expressions, because
; (let ((⟨var1⟩ ⟨exp1⟩) . . . (⟨varn⟩ ⟨expn⟩))
;   ⟨body⟩)
; is equivalent to
; ((lambda(⟨var1⟩ ... ⟨varn⟩)
;    ⟨body⟩)
;  ⟨exp1⟩
;  ...
;  ⟨expn⟩)
; Implement a syntactic transformation let->combination that reduces evaluating
; let expressions to evaluating combinations of the type shown above, and add
; the appropriate clause to eval to handle let expressions.

(define (let? exp) (tagged-list? exp 'let))

(define (let-clauses exp) (cdr exp))

(define (let-combination-clauses clauses) (car exp))

(define (let-body clauses) (cadr clauses))

(define (let-var clause) (car clause))

(define (let-exp clause) (cdr clause))

(define (let->combination exp) (expand-clauses (let-clauses exp)))

(define (expand-clauses clauses)
  (cons (make-lambda (map let-var clauses) (let-body clauses)
        (map let-exp clauses))))
