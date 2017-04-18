#lang scheme
(require test-engine/racket-tests
         rackunit)

(define (sqrt-iter guess x old-guess)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x)
                 x guess)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess old-guess)
  (< (abs ( - guess old-guess)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
 (sqrt-iter 1.0 x 0))

(check-true (< 2.9999 (sqrt 9)) "Square root of 9 is bigger than 2.9999")
(check-true (> 3.0001 (sqrt 9)) "Square root of 9 is smaller than 3.0001")
(check-true (< (- (sqrt 0.1) 0.316227766) 0.00000001) "Square root of 0.1 is close enough")