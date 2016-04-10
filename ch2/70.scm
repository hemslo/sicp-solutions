; The following eight-symbol alphabet with associated relative frequencies was
; designed to efficiently encode the lyrics of 1950s rock songs. (Note that the
; “symbols” of an “alphabet” need not be individual letters.)

; A 2  GET 2  SHA 3  WAH 1  BOOM 1  JOB 2  NA 16  YIP 9

; Use generate-huffman-tree (Exercise 2.69) to generate a corresponding Huffman
; tree, and use encode (Exercise 2.68) to encode the following message:

; Get a job
; Sha na na na na na na na na
; Get a job
; Sha na na na na na na na na
; Wah yip yip yip yip yip yip yip yip yip
; Sha boom

; How many bits are required for the encoding? What is the smallest number of
; bits that would be needed to encode this song if we used a fixed-length code
; for the eight-symbol alphabet?

(load "69.scm")
(load "68.scm")

(define tree
  (generate-huffman-tree '((A 2) (GET 2) (SHA 3) (WAH 1) (BOOM 1) (JOB 2) (NA 16) (YIP 9))))

(encode '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom)
        tree)

; 84, 108
