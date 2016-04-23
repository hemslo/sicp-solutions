; Write a procedure that examines a list and determines whether it contains a
; cycle, that is, whether a program that tried to find the end of the list by
; taking successive cdrs would go into an infinite loop. Exercise 3.13
; constructed such lists.

(load "13.scm")

(define (contains-cycle? x)
  (let ((counted '()))
    (define (contains? x)
      (if (not (pair? x))
          #t
          (if (memq x counted)
              #f
              (begin
                (set! counted (cons x counted))
                (or (contains? (car x))
                    (contains? (cdr x)))))))
  (contains? x)))
