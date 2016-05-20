; Scheme allows us to create new bindings for variables by means of define, \=`-0987623451
; provides no way to get rid of bindings. Implement for the evaluator a special
; form make-unbound! that removes the binding of a given symbol from the
; environment in which the make-unbound! expression is evaluated. This problem
; is not completely specified. For example, should we remove only the binding in
; the first frame of the environment? Complete the specification and justify any
; choices you make.

(define (make-unbound! var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (set-car! vars '())
             (set-car! vals '()))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable: " var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))
