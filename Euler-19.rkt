;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Euler-19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September (9),
April (4), June (6) and November (11).
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

|#

(define-struct date (month day year))
(define a (1 1 1901))

;; day++ : Date -> Date
;; Adds one day to a date.
(define (date++ d)
  (if (or
       ;; Leap year -- Feb has 29 days
       (and (= (modulo (date-year d) 4) 0)
          (= (date-month d) 2)
          (= (date-day d) 29))
       
       ;; September, April, June, or Nov and Day is 30
       (and (or (= (date-month d) 4)
                (= (date-month d) 6)
                (= (date-month d) 9)
                (= (date-month d) 11))
            (date-day 30))
  