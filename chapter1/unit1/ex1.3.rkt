#lang racket

(define (procedure a b c)
  (if (>= a b)
      (if (>= b c)
          (sum-square a b)
          (sum-square a c))
      (if (>= a c)
          (sum-square b a)
          (sum-square b c))))

(define (sum-square x y)
  (+ (square x)
     (square y)))

(define (square x)
  (* x
     x))