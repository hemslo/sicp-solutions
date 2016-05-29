; Ben Bitdiddle tests the lazy list implementation given above by evaluating
; the expression:

(car '(a b c))

; To his surprise, this produces an error. After some thought, he realizes that
; the “lists” obtained by reading in quoted expressions are different from the
; lists manipulated by the new definitions of cons, car, and cdr. Modify the
; evaluator’s treatment of quoted expressions so that quoted lists typed at the
; driver loop will produce true lazy lists.

; eval
; ((quoted? exp) (eval-quoted exp env))

(define (eval-quoted exp env)
  (let ((text (text-of-quotation exp)))
    (if (pair? text)
        (eval (make-list text) env)
        text)))

(define (make-list exps)
  (if (null? exps)
      (list 'quote '())
      (list 'cons (list 'quote (car exps))
                  (make-list (cdr exps)))))
