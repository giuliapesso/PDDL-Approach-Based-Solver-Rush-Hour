(define (problem problem4x4truck) (:domain domainXY)

    ; -----------------
    ; | t | r | 1 |   |
    ; | t | r | 2 |   |
    ; | t | r | 3 | x |
    ; | t | r | 4 |   |
    ; -----------------

    (:objects
        ;m1 - motorcycle
        ;red - car
        t1 t2 t3 t4 t5 t6 t7 - truck
        x1 x2 x3 x4 y1 y2 y3 y4 - position
        x5 x6 x7 x8 x9 x10 - position
        y5 y6 y7 y8 y9 y10 - position
    )
    
    (:init
        (next y2 y1)
        (next y3 y2)
        (next y4 y3)
        (next y5 y4)
        (next y6 y5)
        (next y7 y6)
        (next y8 y7)
        (next y9 y8)
        (next y10 y9)
        (next x2 x1)
        (next x3 x2)
        (next x4 x3)
        (next x5 x4)
        (next x6 x5)
        (next x7 x6)
        (next x8 x7)
        (next x9 x8)
        (next x10 x9)

        (at t1 x1 y1)
        (at t1 x1 y2)
        (at t1 x1 y3)
        
        (at t2 x2 y1)
        (at t2 x2 y2)
        (at t2 x2 y3)

        (at t3 x3 y1)
        (at t3 x3 y2)
        (at t3 x3 y3)

        (at t4 x4 y1)
        (at t4 x4 y2)
        (at t4 x4 y3)

        (occupied x1 y1)
        (occupied x1 y2)
        (occupied x1 y3)
        (occupied x2 y1)
        (occupied x2 y2)
        (occupied x2 y3)
        (occupied x3 y1)
        (occupied x3 y2)
        (occupied x3 y3)
        (occupied x4 y1)
        (occupied x4 y2)
        (occupied x4 y3)

        


        
    )

    (:goal
        (at t1 x1 y10)
    )

)