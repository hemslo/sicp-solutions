; Generalizing one- and two-dimensional tables, show how to implement a table in
; which values are stored under an arbitrary number of keys and different values
; may be stored under different numbers of keys. The lookup and insert!
; procedures should take as input a list of keys used to access the table.

(define (make-table same-key?)
  (let ((local-table (list '*table*)))

  (define (assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records))
           (car records))
          (else (assoc key (cdr records)))))

    (define (lookup keys)
      (fold-left (lambda (acc key)
                    (if acc
                       (let ((record (assoc key acc)))
                         (if record
                             (cdr record)
                             #f))
                        #f))
                 (cdr local-table)
                 keys))

    (define (insert! keys value)
      (set-cdr! (fold-left (lambda (acc key)
                             (let ((record (assoc key (cdr acc))))
                                (if record
                                    record
                                    (let ((new-acc (cons (list key)
                                                         (cdr acc))))
                                      (set-cdr! acc new-acc)
                                      (car new-acc)))))
                           local-table
                           keys)
                value)
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation: TABLE" m))))

  dispatch))
