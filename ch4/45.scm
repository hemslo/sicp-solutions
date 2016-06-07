; With the grammar given above, the following sentence can be parsed in five
; different ways: “The professor lectures to the student in the class with the
; cat.” Give the five parses and explain the differences in shades of meaning
; among them.

(The professor) (lectures to (the student)) (in the class) (with the cat)
(The professor) (lectures to (the student (in the class))) (with the cat)
(The professor) (lectures to (the student)) (in the class (with the cat))
(The professor) (lectures to (the student (in the class (with the cat))))
(The professor) (lectures to (the student (in the class)) (with the cat))
