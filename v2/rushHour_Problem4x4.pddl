(define (problem problem_name) (:domain test)
(:objects 
    m1 - motorcycle
    c1 - car
    t1 - truck
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 - position
)

(:init
    (horizontal p1 p2)(horizontal p2 p3)(horizontal p3 p4)
    (horizontal p5 p6)(horizontal p6 p7)(horizontal p7 p8)
    (horizontal p9 p10)(horizontal p10 p11)(horizontal p11 p12)
    (horizontal p13 p14)(horizontal p14 p15)(horizontal p15 p16)

    (vertical p1 p5)(vertical p2 p6)(vertical p3 p7)(vertical p4 p8)
    (vertical p5 p9)(vertical p6 p10)(vertical p7 p11)(vertical p8 p12)
    (vertical p9 p13)(vertical p10 p14)(vertical p11 p15)(vertical p12 p16)
        
    (at m1 p1)
    
    (at c1 p4)
    (at c1 p8)
   
    (at t1 p5)
    (at t1 p6)
    (at t1 p7)

    (occupied p1)
    (occupied p4)
    (occupied p5)
    (occupied p6)
    (occupied p7)
    (occupied p8)
)

(:goal (and
    ;(at c1 p4)
    ;(at m1 p13)
    (at t1 p8)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
