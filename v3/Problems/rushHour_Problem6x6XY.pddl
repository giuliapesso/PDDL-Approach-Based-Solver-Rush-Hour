(define (problem problem6x6) (:domain domainXY)

    ; -------------------------
    ; |   |   |   |   |   | t |
    ; |   |   |   |   | t | r |
    ; |   |   | re| d | r | 3 |
    ; | c | 1 | t |   | 2 |   |
    ; |   | c | r | m1| c | 3 |
    ; |   | 2 | 1 |   |   |   |
    ; -------------------------

    (:objects
        m1 - motorcycle
        c1 c2 c3 red - car
        t1 t2 t3 - truck
        x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 - position
    )
    
    (:init
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
    
        (at m1 x5 y4)

        (at c1 x4 y1)
        (at c1 x4 y2)
        
        (at c2 x5 y2)
        (at c2 x6 y2)

        (at c3 x5 y5)
        (at c3 x5 y6)
        
        (at red x3 y3)
        (at red x3 y4)

        (at t1 x4 y3)
        (at t1 x5 y3)
        (at t1 x6 y3)
        
        (at t2 x2 y5)
        (at t2 x3 y5)
        (at t2 x4 y5)
        
        (at t3 x1 y6)
        (at t3 x2 y6)
        (at t3 x3 y6)
        
        (occupied x5 y4)
        (occupied x4 y1)
        (occupied x4 y2)
        (occupied x5 y2)
        (occupied x6 y2)
        (occupied x3 y3)
        (occupied x3 y4)
        (occupied x5 y5)
        (occupied x5 y6)
        (occupied x4 y3)
        (occupied x5 y3)
        (occupied x6 y3)
        (occupied x2 y5)
        (occupied x3 y5)
        (occupied x4 y5)
        (occupied x1 y6)
        (occupied x2 y6)
        (occupied x3 y6)
        
    )

    (:goal
        (at red x3 y6)
    )

)