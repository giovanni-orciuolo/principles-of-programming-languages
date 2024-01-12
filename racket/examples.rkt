#lang racket

; BASICS

(displayln "Hello World!")

(define x 5)

(define (say-hello)
  (displayln "Hello World!"))

(define (greet name)
  (if (string? name)
    (displayln (string-append "Hello " name "!"))
    (displayln "Not a string")))

(greet "Andrea")

(define (greet-only-andrea name)
  (if (equal? name "Andrea")
      (displayln "Hello Andrea!") ; then
      (displayln "Go away!"))) ; else

(greet 5)

(define (factorial n)
  (if (zero? n)
      1
      (* n (factorial (- n 1)))))

(factorial 5)

; Tail recursion
; Optimization that compiler makes to avoid stack overflows
(define (factorial-tail-rec n acc)
  (if (zero? n)
      acc
      (factorial-tail-rec (- n 1) (* acc n))))

(factorial-tail-rec 5 1)

