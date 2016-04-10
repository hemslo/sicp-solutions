; The encode procedure takes as arguments a message and a tree and produces the
; list of bits that gives the encoded message.

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

; encode-symbol is a procedure, which you must write, that returns the list of
; bits that encodes a given symbol according to a given tree. You should design
; encode-symbol so that it signals an error if the symbol is not in the tree at
; all. Test your procedure by encoding the result you obtained in Exercise 2.67
; with the sample tree and seeing whether it is the same as the original sample
; message.

(load "67.scm")

(define (encode-symbol symbol tree)
  (define (iter symbol tree result)
    (cond ((leaf? tree) (reverse result))
          ((memq symbol (symbols (left-branch tree)))
           (iter symbol (left-branch tree) (cons 0 result)))
          ((memq symbol (symbols (right-branch tree)))
           (iter symbol (right-branch tree) (cons 1 result)))
          (else (error "the symbol is not in the tree" symbol))))
  (iter symbol tree '()))
