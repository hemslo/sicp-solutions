; Consider the interaction

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z
; (a b c d)

(cdr x)
; ⟨response⟩

(define w (append! x y))

w
; (a b c d)

(cdr x)
; ⟨response⟩

; What are the missing ⟨response⟩s? Draw box-and-pointer diagrams to explain
; your answer.

; 1. (b)
; 2. (b c d)
