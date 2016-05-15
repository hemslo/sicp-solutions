; Recall the definitions of the special forms and and or from Chapter 1:
; • and: The expressions are evaluated from left to right. If any expression
; evaluates to false, false is returned; any remaining expressions are not
; evaluated. If all the expressions evaluate to true values, the value of the
; last expression is returned. If there are no expressions then true is
; returned.
; • or: The expressions are evaluated from left to right. If any expression
; evaluates to a true value, that value is returned; any remaining expressions
; are not evaluated. If all expressions evaluate to false, or if there are no
; expressions, then false is returned.

; Install and and or as new special forms for the evaluator by defining
; appropriate syntax procedures and evaluation procedures eval-and and eval-or.
; Alternatively, show how to implement and and or as derived expressions.

(define (and? exp) (tagged-list? exp 'and))

(define (eval-and exps env)
  (cond ((null? exps) #t)
        ((last-exp? exps)
         (true? (eval (first-exp exps) env)))
        (else (if (true? (eval (first-exp exps) env))
                  (eval-and (rest-exps exps) env)
                  #f))))

(define (or? exp) (tagged-list? exp 'or))

(define (eval-or exps env)
  (cond ((null? exps) #f)
        ((last-exp? exps)
         (true? (eval (first-exp exps) env))
        (else (if (true? (eval (first-exp exps) env))
                  #t
                  (eval-or (rest-exps exps) env))))))

(define (and->if exp) (expand-and-clauses (cdr exp)))

(define (expand-and-clauses clauses)
  (if (null? clauses)
      #t
      (let ((first (car clauses))
            (rest (cdr clauses)))
           (if (null? rest)
               (make-if first first #f)
               (make-if first (expand-and-clauses rest) #f)))))

(define (or->if exp) (expand-or-clauses (cdr exp)))

(define (expand-or-clauses clauses)
  (if (null? clauses)
      #f
      (let ((first (car clauses))
            (rest (cdr clauses)))
           (if (null? rest)
               (make-if first first #f)
               (make-if first first (expand-or-clauses rest))))))
