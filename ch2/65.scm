; Use the results of Exercise 2.63 and Exercise 2.64 to give Θ(n)
; implementations of union-set and intersection-set for sets implemented as
; (balanced) binary trees.

(load "62.scm")
(load "63.scm")
(load "64.scm")

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set (cdr set1)
                                          (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (union-set-tree tree1 tree2)
  (list->tree (union-set (tree->list-2 tree1)
                              (tree->list-2 tree2))))

(define (intersection-set-tree tree1 tree2)
  (list->tree (intersection-set (tree->list-2 tree1)
                                (tree->list-2 tree2))))
