; Examine the stream (pairs integers integers). Can you make any general
; comments about the order in which the pairs are placed into the stream? For
; example, approximately how many pairs precede the pair (1, 100)? the pair
; (99, 100)? the pair (100, 100)? (If you can make precise mathematical
; statements here, all the better. But feel free to give more qualitative
; answers if you find yourself getting bogged down.)

(load "54.scm")

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))


(define (pairs s t)
  (cons-stream (list (stream-car s) (stream-car t))
               (interleave (stream-map (lambda (x) (list (stream-car s) x))
                                       (stream-cdr t))
                           (pairs (stream-cdr s) (stream-cdr t)))))

(define integer-pairs (pairs integers integers))

; 197 before (1 100)
