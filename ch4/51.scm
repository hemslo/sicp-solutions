; Implement a new kind of assignment called permanent-set! that is not undone
; upon failure. For example, we can choose two distinct elements from a list and
; count the number of trials required to make a successful choice as follows:

(define count 0)

(let ((x (an-element-of '(a b c)))
      (y (an-element-of '(a b c))))
  (permanent-set! count (+ count 1))
  (require (not (eq? x y)))
  (list x y count))

;;; Starting a new problem
;;; Amb-Eval value:
(a b 2)
;;; Amb-Eval input:
try-again
;;; Amb-Eval value:
(a c 3)

; What values would have been displayed if we had used set! here rather than
; permanent-set! ?

(define (analyze-permanent-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))

; if use set!, values would be (a b 1) (a c 1)
