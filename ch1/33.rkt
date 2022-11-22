#lang sicp

; You can obtain an even more general version of accumulate (Exercise 1.32) by
; introducing the notion of a filter on the terms to be combined. That is,
; combine only those terms derived from values in the range that satisfy a
; specified condition. The resulting filtered-accumulate abstraction takes the
; same arguments as accumulate, together with an additional predicate of one
; argument that specifies the filter. Write filtered-accumulate as a procedure.
; Show how to express the following using filtered-accumulate:

; a. the sum of the squares of the prime numbers in the interval a to b (
; assuming that you have a prime? predicate already written)

; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (square x) (* x x))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (identity x) x)
(define (inc n) (+ n 1))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-relative-primes n)
  (define (relatively-prime? x)
    (= 1 (gcd x n)))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime?))
