; In this exercise we implement the method just described for interpreting
; internal definitions. We assume that the evaluator supports let (see Exercise
; 4.6).

; a. Change lookup-variable-value (Section 4.1.3) to signal an error if the
; value it finds is the symbol *unassigned*.

; b. Write a procedure scan-out-defines that takess a procedure body and returns
; an equivalent one that has no internal definitions, by making the
; transformation described above.

; c. Install scan-out-defines in the interpreter, either in make-procedure or in
; procedure-body (see Section 4.1.3). Which place is better? Why?

; a
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars)
             (let ((val (car vals)))
               (if (eq? val "*unassigned*")
                   (error "*unassigned*")
                   val))))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

; b
(define (scan-out-defines body))
; TODO

; c
; make-procedure
(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))
