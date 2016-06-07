; Alyssa P. Hacker is more interested in generating interesting sentences than
; in parsing them. She reasons that by simply changing the procedure parse-word
; so that it ignores the “input sentence” and instead always succeeds and
; generates an appropriate word, we can use the programs we had built for
; parsing to do generation instead. Implement Alyssa’s idea, and show the first
; half-dozen or so sentences generated.

(define (parse-word word-list)
  (require (not (null? *unparsed*)))
  (set! *unparsed* (cdr *unparsed*))
  (list (car word-list) (amb (cdr word-list))))
