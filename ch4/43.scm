; Use the amb evaluator to solve the following puzzle:
; Mary Ann Moore’s father has a yacht and so has each of his four friends:
; Colonel Downing, Mr. Hall, Sir Barnacle Hood, and Dr. Parker. Each of the five
; also has one daughter and each has named his yacht after a daughter of one of
; the others. Sir Barnacle’s yacht is the Gabrielle, Mr. Moore owns the Lorna;
; Mr. Hall the Rosalind. The Melissa, owned by Colonel Downing, is named after
; Sir Barnacle’s daughter. Gabrielle’s father owns the yacht that is named after
; Dr. Parker’s daughter. Who is Lorna’s father?

; Try to write the program so that it runs efficiently (see Exercise 4.40). Also
; determine how many solutions there are if we are not told that Mary Ann’s last
; name is Moore.

(define (yacht)
  (let ((Moore-yacht 'Lorna)
        (Barnacle-yacht 'Gabrielle)
        (Hall-yacht 'Rosalind)
        (Downing-yacht 'Melissa)
        (Parker-yacht 'Mary))
    (let ((Moore-daughter 'Mary)
          (Barnacle-daughter 'Melissa)
          (Hall-daughter (amb 'Gabrielle 'Lorna))
          (Downing-daughter (amb 'Gabrielle 'Lorna 'Rosalind))
          (Parker-daughter (amb 'Lorna 'Rosalind)))
      (require (or (and (= Hall-daughter 'Gabrielle)
                        (= Parker-daughter 'Rosalind))
                   (and (= Downing-daughter 'Gabrielle)
                        (= Parker-daughter 'Melissa))))
      (require (distinct? (list Hall-daughter Downing-daughter Parker-daughter)))
      (list (list 'Moore Moore-daughter)
            (list 'Barnacle Barnacle-daughter)
            (list 'Hall Hall-daughter)
            (list 'Downing Downing-daughter)
            (list 'Parker Parker-daughter)))))
