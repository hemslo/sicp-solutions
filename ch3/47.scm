; A semaphore (of size n) is a generalization of a mutex. Like a mutex, a
; semaphore supports acquire and release operations, but it is more general in
; that up to n processes can acquire it concurrently. Additional processes that
; attempt to acquire the semaphore must wait for release operations. Give
; implementations of semaphores

; a. in terms of mutexes
; b. in terms of atomic test-and-set! operations.

(define (make-semaphore n)
  (let ((mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (mutex 'acquire)
               (if (> n 0)
                 (begin (set! n (- n 1)) (mutex 'release))
                 (begin (lock 'release) (the-semaphore 'acquire))))
            ((eq? m 'release)
             (lock 'acquire)
             (set! n (+ 1 n))
             (lock 'release))))
    the-semaphore))
