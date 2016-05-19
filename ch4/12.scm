; The procedures set-variable-value!, define-variable! and lookup-variable-value
; can be expressed in terms of more abstract procedures for traversing the
; environment structure. Define abstractions that capture the common patterns
; and redefine the three procedures in terms of these abstractions.

(define (scan proc vars vals)
  (cond ((not (null? vars))
         (proc (car vars) (car vals)))
        (else (scan proc (cdr vars) (cdr vals)))))

(define (lookup-variable-value var env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (if (null? (frame-variables frame))
              (env-loop (enclosing-environment env))
              (scan (lambda (vara vala) (vala))
                    (frame-variables frame)
                    (frame-values frame))))))
  (env-loop env))

(define (set-variable-value! var val env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "Unbound variable: SET!" var)
        (let ((frame (first-frame env)))
          (if (null? (frame-variables frame))
              (env-loop (enclosing-environment env))
              (scan (lambda (vara vala) (set-car! vals val))
                    (frame-variables frame)
                    (frame-values frame))))))
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (if (null? (frame-variables frame))
        (add-binding-to-frame! var val frame)
        (scan (lambda (vara vala) (set-car! vals val))
              (frame-variables frame)
              (frame-values frame)))))
