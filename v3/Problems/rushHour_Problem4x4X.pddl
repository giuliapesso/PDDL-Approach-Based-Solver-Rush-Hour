(define (problem problem4x4) (:domain domainXY)

    ; -----------------
    ; | m |   |   |   |
    ; |   |   | 1 |   |
    ; |   |   | r |   |
    ; | c | 1 | t | x |
    ; -----------------

    (:objects
        m1 - motorcycle
        c1 - car
        t1 - truck
        x1 x2 x3 x4 y1 y2 y3 y4  - position
    )
    
    (:init
        (at m1 x1 y1)

        (at c1 x4 y1)
        (at c1 x4 y2)

        (at t1 x2 y3)
        (at t1 x3 y3)
        (at t1 x4 y3)

        (next x2 x1) 
        (next x3 x2)
        (next x4 x3)
        
        (next y2 y1) 
        (next y3 y2)
        (next y4 y3)

        (occupied x1 y1)
        (occupied x4 y1)
        (occupied x4 y2)
        (occupied x2 y3)
        (occupied x3 y3)
        (occupied x4 y3)
        
    )

    (:goal
        (at  c1 x4 y4)
    )

)