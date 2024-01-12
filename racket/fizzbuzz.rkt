#lang racket

(define (divisible-by? n m)
  (zero? (modulo n m)))

(define (fizzbuzz n)
  (cond [(divisible-by? n 15) "FizzBuzz"]
        [(divisible-by? n 5) "Buzz"]
        [(divisible-by? n 3) "Fizz"]
        [else n]))

(map fizzbuzz (range 1 100))