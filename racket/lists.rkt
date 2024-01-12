#lang racket

(define numbers (list 1 2 3 4 (+ 3 2)))
numbers ; Returns quoted list after execution

(define numbers2 '(+ 2 3 4 (+ 3 2)))
numbers2 ; The quote operator makes the whole thing not execute!

(define empty-list '())
empty-list

; Higher order functions

; The classic map: returns a new list where each value has been applied to the mapper lambda function
(map (λ (x) (* x 2)) numbers)

; Fold is the reduce function: reduces a list by applying a function (first parameter, function receives current value and accumulator as parameters) with an initial value (second parameter)
; Third parameter is the list
(foldl + 0 numbers) ; foldl starts from the left of the list and goes to the right <- FASTER, RECOMMENDED
(foldr + 0 numbers) ; foldr starts from the end of the list and goes to the left <- SLOWER, NOT TAIL RECURSIVE
; Of course, the result is the same in this case, but in other cases the order might matter

; cons is the function that creates a pair
(cons 1 2) ; '(1 . 2) <- dot tells us that this is a pair

; A list is a linked list of chained cons pairs
(cons 1 (cons 2 '())) ; Prints '(1 2)

; Given a pair, it is possible to extract the first element with car and the second element with cdr (spelled CADR)
(define pair (cons 1 2))
(car pair)
(cdr pair)

; Let's define a function to reverse a list
(define (reverse-list lst)
  (define (reverser x acc)
    (displayln (string-append "x = " (~a x) "; acc = " (~a acc)))
    (if (null? x)
        acc
        (reverser (cdr x)
                             (cons (car x) acc))))
  (reverser lst '()))

(reverse-list numbers)

; Alternative factorial implementation with foldl
(define (factorial n)
  (foldl * 1 (range 1 n)))

(factorial 10)