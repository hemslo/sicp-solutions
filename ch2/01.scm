; Define a better version of make-rat that handles both positive and negative
; arguments. make-rat should normalize the sign so that if the rational number
; is positive, both the numerator and denominator are positive, and if the
; rational number is negative, only the numerator is negative.

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd (abs n) (abs d)))))
    (cons (/ n g) (/ d g))))
