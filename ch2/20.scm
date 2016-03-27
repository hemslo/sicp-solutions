; Use this notation to write a procedure same-parity that takes one or more
; integers and returns a list of all the arguments that have the same even-odd
; parity as the first argument. For example,

; (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)

; (same-parity 2 3 4 5 6 7)
; (2 4 6)

(define (same-parity head . tail)
  (let ((same-parity? (if (odd? head) odd? even?)))
    (define (iter items result)
      (if (null? items)
          (reverse result)
          (iter (cdr items)
                (if (same-parity? (car items))
                    (cons (car items) result)
                    result))))
    (iter tail (list head))))
