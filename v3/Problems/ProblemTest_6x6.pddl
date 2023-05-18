(define (problem Test6x6) (:domain domainXY)

    ; -----------------
    ; |   |   |   |   |
    ; |   |   | 1 |   |
    ; |   |   | r |   |
    ; | re| d | t | x m1 |
    ; -----------------

    (:objects
        m1 - motorcycle
        red - car
        t1 - truck
        x1 x2 x3 x4 y1 y2 y3 y4 x5 y5 x6 y6 - position
    )
    
    (:init
        (at m1 x4 y4)

        (at red x4 y1)
        (at red x4 y2)

        (at t1 x2 y3)
        (at t1 x3 y3)
        (at t1 x4 y3)

        (next x2 x1) 
        (next x3 x2)
        (next x4 x3)
        (next x5 x4)
        (next x6 x5)
        
        (next y2 y1) 
        (next y3 y2)
        (next y4 y3)
        (next y5 y4)
        (next y6 y5)

        (occupied x4 y4)
        (occupied x4 y1)
        (occupied x4 y2)
        (occupied x2 y3)
        (occupied x3 y3)
        (occupied x4 y3)
        
    )

    (:goal
        (at red x4 y4)
    )

)