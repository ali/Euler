;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Euler-19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; Project Euler - Problem #53
;; Solved by Ali Ukani on May 10, 2011

;; A year is three numbers
;; - Month (Jan = 0, Feb = 1, ... Dec = 11)
;; - Day of Week (Sun = 0, Mon = 1..., Sun = 6)
;; - Year 
(define-struct date (month day year))
(define o (make-date 0 1 1900))

;; days+= : Number -> Number
;; Number % 7
(define (days+= a b)
  (modulo (+ a b) 7))
(check-expect (days+= 1 31) 4)
(check-expect (days+= 7 31) 3)
(check-expect (days+= 3 28) 3)

;; month++ : Date -> Date
;; Moves a month forward
#;(define (month++ d)
    (local [(define (leap? d)
              (cond
                [(or (and (= (modulo (date-year d) 400) 0)
                          (= (modulo (date-year 
                     (= (modulo (
  (cond
    [(= (date-month d) 12) (make-date 1
                                      (days+= (date-day d)
                                              31)
                                      (add1 (date-year d)))]
    [(= (date-month d) 2) (make-date 3
                                     (cond 
                                     (date-year d))]
    [(or (= (date-month d) 9)
         (= (date-month d) 4)
         (= (date-month d) 6)
         (= (date-month d) 11)) (make-date ())]))