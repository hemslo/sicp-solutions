; A function f is defined by the rule that
; f(n) = n if n < 3,
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
; Write a procedure that computes f by means of a recursive process. Write a
; procedure that computes f by means of an iterative process.

(define (recur-f n)
  (if (< n 3)
      n
      (+ (recur-f (- n 1))
         (* 2 (recur-f (- n 2)))
         (* 3 (recur-f (- n 3))))))

(define (iter-f n)
  (define (iter a b c count)
    (if (= count 0)
        c
        (iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
  (iter 2 1 0 n))
