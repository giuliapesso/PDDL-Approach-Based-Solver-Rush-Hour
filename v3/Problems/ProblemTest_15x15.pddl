(define (problem Test15x15) (:domain domainXY)

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
        x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 x6 y6 x7 y7 x8 y8 x9 y9 x10 y10 x11 y11 x12 y12 x13 y13 x14 y14 x15 y15 - position    )
    
    (:init
        (at m1 x4 y4)

        (at red x4 y1)
        (at red x4 y2)

        (at t1 x2 y3)
        (at t1 x3 y3)
        (at t1 x4 y3)

        (next y2 y1)
        (next y3 y2)
        (next y4 y3)
        (next y5 y4)
        (next y6 y5)
        (next y7 y6)
        (next y8 y7)
        (next y9 y8)
        (next y10 y9)
        (next y11 y10)
        (next y12 y11)
        (next y13 y12)
        (next y14 y13)
        (next y15 y14)

   
     

        (next x2 x1)
        (next x3 x2)
        (next x4 x3)
        (next x5 x4)
        (next x6 x5)
        (next x7 x6)
        (next x8 x7)
        (next x9 x8)
        (next x10 x9)
        (next x11 x10)
        (next x12 x11)
        (next x13 x12)
        (next x14 x13)
        (next x15 x14)

  


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