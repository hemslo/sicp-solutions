; Modify the make-account procedure of Exercise 3.3 by adding another local
; state variable so that, if an account is accessed more than seven consecutive
; times with an incorrect password, it invokes the procedure call-the-cops.

(define (make-account balance password)
  (let ((incorrect-times 0)
        (max-incorrect-times 7))
    (define (call-the-cops) "Call the cops")
    (define (withdraw amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch pass m)
      (if (not (eq? pass password))
          (lambda (x)
            (set! incorrect-times (+ 1 incorrect-times))
            (if (> incorrect-times max-incorrect-times)
                (call-the-cops)
                "Incorrect password"))
          (begin
            (set! incorrect-times 0)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  (else (error "Unknown request: MAKE-ACCOUNT"
                               m))))))
    dispatch))
