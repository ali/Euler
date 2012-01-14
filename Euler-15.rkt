;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Euler-15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Project Euler - Problem #15
;; Solved by Ali Ukani on Dec 31, 2011
;; "Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner. How many routes are there through a 20x20 grid?"

;; Bruteforcing it sounded boring, so I just calculated Pascal's Triangle's 40th row.

;; pascal-row-acc : Int Int [Listof Integer] -> [Listof Integer]
;; Calculates row r+1 of Pascal's Triangle (r cannot be < 1)
;; http://en.wikipedia.org/wiki/Pascal%27s_triangle#Calculating_an_individual_row_or_diagonal_by_itself
(define (pascal-row-acc r c acc)
  (cond
    [(= c r) acc]
    [(= c 0) (pascal-row-acc r (+ c 1) (list 1))]
    [else (pascal-row-acc r (+ c 1) (cons (* (car acc)
                                             (/ (- r c) c))
                                          acc))]))
  
(check-expect (pascal-row-acc 1 0 empty) (list 1))
(check-expect (pascal-row-acc 2 0 empty) (list 1 1))
(check-expect (pascal-row-acc 3 0 empty) (list 1 2 1))
(check-expect (pascal-row-acc 4 0 empty) (list 1 3 3 1))
(check-expect (pascal-row-acc 5 0 empty) (list 1 4 6 4 1))
(check-expect (pascal-row-acc 6 0 empty) (list 1 5 10 10 5 1))

;; pascal-row : Integer -> [Listof Integer]
;; Returns the nth row of Pascal's Triangle
(define (pascal-row n)
  (pascal-row-acc (+ n 1) 0 empty))

(check-expect (pascal-row 0) (list 1))
(check-expect (pascal-row 1) (list 1 1))
(check-expect (pascal-row 2) (list 1 2 1))
(check-expect (pascal-row 3) (list 1 3 3 1))
(check-expect (pascal-row 4) (list 1 4 6 4 1))
(check-expect (pascal-row 5) (list 1 5 10 10 5 1))

;; Solve -- grab the middle number of the 40th row
((λ (n) (list-ref 
         (pascal-row n)
         (floor (/ (+ n 1) 2))))
 40)