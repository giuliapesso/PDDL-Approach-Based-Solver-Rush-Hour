(define (problem problem8x8) (:domain domainXY)

    ; -----------------------------------
    ;     1   2   3   4   5   6   7   8
    ; 1 |   |   |   |   |   | t |   |   |
    ; 2 |   |   |   |   |   | r |   |   |
    ; 3 | m2|re | d | c |   | 3 |   | X |
    ; 4 |   |   |   | 2 |   |   |   |   |
    ; 5 |   |   |   |   |   |   | t |   |
    ; 6 |   | t | r | 2 |   |   | r |   |
    ; 7 |   | m1|   | c |   |   | 4 |   |
    ; 8 | t | r | 1 | 1 |   |   |   |   |
    ; ------------------------------------

    (:objects
        m1 m2 - motorcycle
        c1 c2 red - car
        t1 t2 t3 t4 - truck
        x1 x2 x3 x4 x5 x6 x7 x8 y1 y2 y3 y4 y5 y6 y7 y8  - position
    )
    
    (:init
        (next x2 x1) 
        (next x3 x2)
        (next x4 x3)
        (next x5 x4)
        (next x6 x5)
        (next x7 x6)
        (next x8 x7)
        
        (next y2 y1) 
        (next y3 y2)
        (next y4 y3)
        (next y5 y4)
        (next y6 y5)
        (next y7 y6)
        (next y8 y7)
        
        (at m1 x7 y2)
        (at m2 x3 y1)


        (at c1 x7 y4)
        (at c1 x8 y4)
        
        (at c2 x3 y4)
        (at c2 x4 y4)

        (at red x3 y2)
        (at red x3 y3)
        
        (at t1 x8 y1)
        (at t1 x8 y2)
        (at t1 x8 y3)
        
        (at t2 x6 y2)
        (at t2 x6 y3)
        (at t2 x6 y4)
        
        (at t3 x1 y6)
        (at t3 x2 y6)
        (at t3 x3 y6)

        (at t4 x5 y7)
        (at t4 x6 y7)
        (at t4 x7 y7)
        
        (occupied x7 y2)
        (occupied x3 y1)
        (occupied x7 y4)
        (occupied x8 y4)      
        (occupied x3 y4)
        (occupied x4 y4)     
        (occupied x8 y1)
        (occupied x8 y2)
        (occupied x8 y3)      
        (occupied x6 y2)
        (occupied x6 y3)
        (occupied x6 y4)      
        (occupied x1 y6)
        (occupied x2 y6)
        (occupied x3 y6)
        (occupied x5 y7)
        (occupied x6 y7)
        (occupied x7 y7)
        
        
    )

    (:goal
        (at red x3 y8)

    )

)