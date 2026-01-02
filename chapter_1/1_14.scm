#|
Draw the tree illustrating the process gen-
erated by the count-change procedure of Section 1.2.2 in
making change for 11 cents. What are the orders of growth
of the space and number of steps used by this process as
the amount to be changed increases?
|#



; .50 | .25 | .10 | .05 | .01
; .11 cents as amount neeeded


; (print (count-change 0.11) ) -> (cc 0.11 5)

;                                                                 ( cc .11 5 )
;                                   (cc .11 4)                          +                       (cc -0.39 5)
;                       (cc .11 3)             +                          (cc -0.14 3)                [0]
;               (cc .11 2)              +           (cc .01 3)                 [0]
;       (cc .11 1)    +   (cc 0.06 2)          (cc .01 2) + (cc -.09 3)




; resume here:

;                   (cc .11 1)          +           (cc 0.06 2)                                                             (cc .01 2)          +                       (cc -.09 3)
;            (c .11 0) + (cc .10 1)              (cc 0.06 1)             +          (cc 0.01 2)                     (cc 0.01 1) +           (cc -0.4 2)                   [0]
;               [0]    (cc .10 0) + (cc .09 1)  (cc 0.06 0) + (cc 0.05 1)         (cc 0.01 1) + (cc -0.04 2)        (cc 0.01 0) + (cc 0 1)      [0]
;                       [0]      0.09 0 + 0.08 1   [0]    (cc 0.05 0) + (cc 0.04 1) (cc 0.01 0) + 0 1 [0]               [0]         [1]
;                                [0]  0.08 0 + 0.07 1     [0]        0.04 0 + 0.03 1  [0]        [1]
;                                       [0]     ...                   [0]      ...
;                                       0.01 0    + 0 1                     0.01 0 + 0 1
;                                         [0]       [1]                     [0]       [1]


; we in total got 4 ways for the change of the $0.11 amount


; the order of growth is O(n) since the deep of the tree is subtracted -0.01 each iteration , 
; and the number of steps is O(n^k) where k is the amount of types of coins (since it stops growing when the kind of coin is <= 0) 
