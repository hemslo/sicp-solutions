; Abstract your answer to Exercise 2.30 to produce a procedure tree-map with the
; property that square- tree could be defined as

(define (square-tree tree)
  (tree-map square tree))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))
