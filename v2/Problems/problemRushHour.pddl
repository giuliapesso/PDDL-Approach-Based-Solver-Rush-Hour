(define (problem problem_name) (:domain domainName)
(:objects
    m1 - macchina
    p1 p2 p3 p4 p5 p6 p7 p8 - posizione
    
)

(:init
    (hor p1 p2)
    (hor p2 p3)
    (hor p4 p5)
    (hor p6 p5)
    (hor p6 p7)
    (hor p7 p8)
    (at m1 p5)
    (at m1 p6)
    ;todo: put the initial state's facts and numeric values here
)

(:goal (and
    (haRagg p4)
    (haRagg p8)
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
