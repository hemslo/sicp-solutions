; Define a better version of make-rat that handles both positive and negative
; arguments. make-rat should normalize the sign so that if the rational number
; is positive, both the numerator and denominator are positive, and if the
; rational number is negative, only the numerator is negative.

(define (make-rat n d)
  (if (< d 0)
      (cons (- n) (- d))
      (cons n d)))
