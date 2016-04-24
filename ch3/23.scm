; A deque (“double-ended deque”) is a sequence in which items can be inserted
; and deleted at either the front or the rear. Operations on deques are the
; constructor make-deque, the predicate empty-deque?, selectors front-deque and
; rear-deque, mutators front-insert-deque!, rear-insert-deque!,
; front-delete-deque!, and rear-delete-deque!. Show how to represent deques
; using pairs, and give implementations of the operations. All operations should
; be accomplished in Θ(1) steps.

(define (make-deque)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (set-front-ptr! item) (set! front-ptr item))

    (define (set-rear-ptr! item) (set! rear-ptr item))

    (define (empty-deque?)
      (null? front-ptr))

    (define (front-deque)
      (if (empty-deque?)
          (error "FRONT called with an empty deque")
          (car front-ptr)))

    (define (rear-deque)
      (if (empty-deque?)
          (error "RAER called with an empty deque")
          (car rear-ptr)))

    (define (front-insert-deque! item)
      (let ((new-pair (cons item front-ptr)))
        (if (empty-deque?) (set-rear-ptr! new-pair))
        (set-front-ptr! new-pair)))

    (define (rear-insert-deque! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-deque?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair))
              (else
                (set-cdr! rear-ptr new-pair)
                (set-rear-ptr! new-pair)))))

    (define (front-delete-deque!)
      (cond ((empty-deque?)
             (error "DELETE! called with an empty deque"))
            (else
              (set-front-ptr! (cdr front-ptr)))))

    (define (prev-rear)
      (define (iter curr)
        (if (null? (cdr (cdr curr)))
            curr
            (iter (cdr curr))))
      (iter front-ptr))

    (define (rear-delete-deque!)
      (cond ((empty-deque?)
             (error "DELETE! called with an empty deque"))
            ((null? (cdr front-ptr))
             (set-front-ptr! '()))
            (else
              (let ((new-rear (prev-rear)))
                (set-cdr! new-rear '())
                (set-rear-ptr! new-rear)))))

    (define (print-deque) front-ptr)

    (define (dispatch m)
      (cond ((eq? m 'empty-deque?) empty-deque?)
            ((eq? m 'front-deque) front-deque )
            ((eq? m 'rear-deque) rear-deque )
            ((eq? m 'front-insert-deque!) front-insert-deque!)
            ((eq? m 'rear-insert-deque!) rear-insert-deque!)
            ((eq? m 'front-delete-deque!) front-delete-deque!)
            ((eq? m 'rear-delete-deque!) rear-delete-deque!)
            ((eq? m 'print-deque) print-deque)
            (else (error "undefined operation -- deque" m))))
    dispatch))

; prev-rear is O(n)
