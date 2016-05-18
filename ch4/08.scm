; “Named let” is a variant of let that has the form
; (let ⟨var⟩ ⟨bindings⟩ ⟨body⟩)
; The ⟨bindings⟩ and ⟨body⟩ are just as in ordinary let, except that ⟨var⟩ is
; bound within ⟨body⟩ to a procedure whose body is ⟨body⟩ and whose parameters
; are the variables in the ⟨bindings⟩. Thus, one can repeatedly execute the
; ⟨body⟩ by invoking the procedure named ⟨var⟩. For example, the iterative
; Fibonacci procedure (Section 1.2.2) can be rewritten using named let as
; follows:

;(define (fib n)
;  (let fib-iter ((a 1)
;                 (b 0)
;                 (count n))
;    (if (= count 0)
;        b
;        (fib-iter (+ a b) a (- count 1)))))

; Modify let->combination of Exercise 4.6 to also support named let.

(define (let-named? clauses) (symbol? (car clauses)))

(define (let-named-var clauses) (car clauses))

(define (let-named-bindings clauses) (cadr clauses))

(define (let-named-body clauses) (caddr clauses))

(define (make-define name-and-parameters body)
  (list 'define name-and-parameters body))

(define (expand-clauses clauses)
  (if (let-named? clauses)
      (sequence->exp (make-define (cons (let-named-var clauses)
                                        (map car (let-named-bindings)))
                                  (let-named-body clauses)))
      (cons (make-lambda (map let-var clauses) (let-body clauses)
            (map let-exp clauses)))))
