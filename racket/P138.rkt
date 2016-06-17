#lang racket
(require "pythagorean-triples.rkt")

; L = sqrt((b / 2)^2 + (b +- 1)^2)
; => all pythagorean triples such that b = 2a +- 1
; Starting with (8,15,17), all primitive triples with this property are generated by the
; pythagorean tree by following the B and then C branch.
; Only primitive triples may have this property.

(define base-triple (next-triple-c (first base-triples)))
(define (next-valid-triple triple)
  (next-triple-c (next-triple-b triple)))

(let loop ([triple base-triple] [count 0] [acc 0])
  (if (= count 12)
      acc
      (loop (next-valid-triple triple) (add1 count) (+ acc (third triple)))))