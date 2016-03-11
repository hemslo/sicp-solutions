; Simpson’s Rule is a more accurate method of numerical integration than the
; method illustrated above. Using Simpson’s Rule, the integral of a function f
; between a and b is approximated as
; h / 3 * (y0 + 4*y1 + 2*y2 + 4*y3 + 2*y4 +···+ 2*yn−2 + 4*yn−1 + yn)
; where h = (b − a)/n, for some even integer n, and yk = f (a + kh). (Increasing
; n increases the accuracy of the approximation.) Define a procedure that takes
; as arguments f , a, b, and n and returns the value of the integral, com puted
; using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to those of the integral
; procedure shown above.

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (* (cond ((or (= k 0) (= k n)) 1.0)
             ((odd? k) 4.0)
             (else 2.0))
       (y k)))
  (* (/ h 3.0) (sum term 0 inc n)))

(integral cube 0 1 100)
(integral cube 0 1 1000)
