; Without running the program, describe the elements of the stream defined by

(define s (cons-stream 1 (add-streams s s)))

; 1 2 4 6 8 10 ...
