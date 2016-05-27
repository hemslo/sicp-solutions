; Exhibit a program that you would expect to run much more slowly without
; memoization than with memoization. Also, consider the following interaction,
; where the id procedure is defined as in Exercise 4.27 and count starts at 0:

(define (square x) (* x x))

;;; L-Eval input:
(square (id 10))

;;; L-Eval value:
; ⟨response⟩

;;; L-Eval input:
count

;;; L-Eval value:
; ⟨response⟩

; Give the responses both when the evaluator memoizes and when it does not.

; memoizes: 100 1
; not: 100 2
