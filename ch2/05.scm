; Show that we can represent pairs of nonneg- ative integers using only number
;  and arithmetic operations if we represent the pair a and b as the integer
; that is the product 2^a * 3^b. Give the corresponding definitions of the
; procedures cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (count-divide n d)
  (define (iter a e)
    (if (= (remainder e d) 0)
        (iter (+ 1 a) (/ e d))
        a))
  (iter 0 n))

(define (car c)
  (count-divide c 2))

(define (cdr c)
  (count-divide c 3))
