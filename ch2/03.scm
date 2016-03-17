; Implement a representation for rectangles in a plane. (Hint: You may want to
; make use of Exercise 2.2.) In terms of your constructors and selectors, create
; procedures that compute the perimeter and the area of a given rectangle. Now
; implement a different representation for rectangles. Can you design your
; system with suitable abstraction barriers, so that the same perimeter and area
; procedures will work using either representation?

(load "02.scm")

(define (make-rect top-left bottom-right)
  (cons top-left bottom-right))

(define (top-left rect)
  (car rect))

(define (bottom-right rect)
  (cdr rect))

(define (width rect)
  (abs (- (x-point (top-left rect))
          (x-point (bottom-right rect)))))

(define (height rect)
  (abs (- (y-point (top-left rect))
          (y-point (bottom-right rect)))))

(define (perimeter rect)
  (* 2 (+ (width rect)
          (height rect))))

(define (area rect)
  (* (width rect)
     (height rect)))
