; Rewrite eval so that the dispatch is done in data-directed style. Compare this
; with the data-directed differentiation procedure of Exercise 2.73. (You may
; use the car of a compound expression as the type of the expression, as is
; appropriate for the syntax implemented in this section.)

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((get 'eval (car exp)) ((get 'eval (car exp)) (cdr exp) env))
        ((application? exp) (apply (eval (operator exp) env)
                                   (list-of-values (operands exp) env)))
        (else (error "Unknown expression type: EVAL" exp))))

(put 'eval 'quote text-of-quotation)
(put 'eval 'set! eval-assignment)
(put 'eval 'define eval-definition)
(put 'eval 'if eval-if)
(put 'eval 'lambda (lambda (exp env) (make-procedure (lambda-parameters exp)
                                                     (lambda-body exp)
                                                     env)))
(put 'eval 'begin (lambda (exp env) (eval-sequence (begin-actions exp) env)))
(put 'eval 'cond (lambda (exp env) (eval (cond->if exp) env)))
