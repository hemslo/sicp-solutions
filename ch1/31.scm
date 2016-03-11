; a. The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of a
; function at points over a given range. Show how to define factorial in terms
; of product. Also use product to compute approximations to π using the formula
; π / 4 = (2 * 4 * 4 * 6 * 6 * 8 ...) / (3 * 3 * 5 * 5 * 7 * 7 ...)

; b. If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

; a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (term x) x)
  (define (next x) (+ 1 x))
  (product term 1 next n))

(define (pi-product a b)
  (define (pi-term x)
    (if (odd? x)
        (/ (+ x 1) (+ x 2))
        (/ (+ x 2) (+ x 1))))
  (define (pi-next x)
    (+ 1 x))
  (product pi-term a pi-next b))

(* 4.0 (pi-product 1 1000))

; b
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
