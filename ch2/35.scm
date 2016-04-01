; Redefine count-leaves from Section 2.2.2 as an accumulation:

(define accumulate fold-right)

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (sub-tree)
                      (if (pair? sub-tree)
                          (count-leaves sub-tree)
                          1))
                   t)))
