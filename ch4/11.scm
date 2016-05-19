; Instead of representing a frame as a pair of lists, we can represent a frame
; as a list of bindings, where each binding is a name-value pair. Rewrite the
; environment operations to use this alternative representation.

(define (make-frame variables values)
  (map (lambda (x) (cons (car x) (cadr x))) (list variables values)))

(define (frame-variables frame)
  (map car frame))

(define (frame-values frame)
  (map cdr frame))

(define (add-binding-to-frame! var val frame)
  (append frame (list (cons var val))))
