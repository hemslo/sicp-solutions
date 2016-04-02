; eight-queens puzzle

(define accumulate fold-right)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position
                      new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (safe? k positions)
  (let ((k-queen (find (lambda (pos) (= k (cdr pos))) positions)))
    (for-all? (filter (lambda (pos) (not (= k (cdr pos)))) positions)
              (lambda (queen)
                (and (not (= (car queen) (car k-queen)))
                     (not (= (abs (- (car queen) (car k-queen)))
                             (abs (- (cdr queen) (cdr k-queen))))))))))

(define (adjoin-position new-row k rest-of-queens)
  (cons (cons new-row k) rest-of-queens))
