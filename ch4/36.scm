; Exercise 3.69 discussed how to generate the stream of all Pythagorean triples,
; with no upper bound on the size of the integers to be searched. Explain why
; simply replacing an-integer-between by an-integer-starting-from in the
; procedure in Exercise 4.35 is not an adequate way to generate arbitrary
; Pythagorean triples. Write a procedure that actually will accomplish this.
; (That is, write a procedure for which repeatedly typing try-again would in
; principle eventually generate all Pythagorean triples.)

; k will be no upper bound

(define (a-pythagorean-triple-between low)
  (let ((k (an-integer-starting-from low)))
    (let ((i (an-integer-between low k)))
      (let ((j (an-integer-between i k)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))
