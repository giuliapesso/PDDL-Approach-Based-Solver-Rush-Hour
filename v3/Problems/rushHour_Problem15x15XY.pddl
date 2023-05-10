(define (problem problem15x15) (:domain domainXY)

    ; ----------------------------------------------------------------
    ;     1   2   3   4   5   6   7   8   9   10  11  12  13  14  15
    ; 1 |re | d | X |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 2 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 3 |   |   |   |   |   |   |   |   |   |   |   |m1 |   |   |   |
    ; 4 |   | c | 1 |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 5 |   |   |   |   |   |   |   |   | t |   |   |   |   |   |   |
    ; 6 |   |   | c | 4 | c |   |   |   | r |   |   |m4 |   |   |   |
    ; 7 |   |   |   |   | 6 | t | r | 1 | 5 |   |   |   |   |   |   |
    ; 8 |   |   |   | t |   | t |   |   | c |   |   |   |   |   |   |
    ; 9 |   |   | m2| r |   | r |   |   | 2 |   |   |   |   |   |m5 |
    ; 10|   |m7 |   | 7 |   | 4 |   |   |   |   |   | t |   |   |   |
    ; 11|   |   |   | c | 3 |   |   |   | t | r | 2 | r |   |   |   |
    ; 12|   |   |   | m3|   |   |   |   |   |   |   | 3 |   |   |   |
    ; 13|   |   |   |   |   |   |   |   |   |   |   |   |   |   |m6 |
    ; 14|   |   |   | c |   |   |   |   | t | r | 6 | c |   |   |   |
    ; 15|   |   |   | 5 |   |   |   |   |   |   |   | 3 |   |   |   |
    ; -----------------------------------------------------------------

    (:objects
        m1 m2 m3 m4 m5 m6 m7 - motorcycle
        c1 c2 c3 c4 c5 c6 red - car
        t1 t2 t3 t4 t5 t6 t7 - truck
        x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 - position
    )
    
    (:init
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
        
    
        (at m1 x3 y12)
        (at m2 x9 y3)
        (at m3 x12 y4)
        (at m4 x6 y12)
        (at m5 x9 y15)
        (at m6 x13 y15)
        (at m7 x10 y2)

        (at c1 x4 y2)
        (at c1 x4 y3)

        (at c2 x8 y9)
        (at c2 x9 y9)

        (at c3 x11 y4)
        (at c3 x11 y5)

        (at c4 x6 y3)
        (at c4 x6 y4)

        (at c5 x14 y4)
        (at c5 x15 y4)
        
        (at c6 x6 y5)
        (at c6 x7 y5)

        (at red x1 y1)
        (at red x1 y2)
        
        (at t1 x7 y6)
        (at t1 x7 y7)
        (at t1 x7 y8)

        (at t2 x11 y9)
        (at t2 x11 y10)
        (at t2 x11 y11)

        (at t3 x10 y12)
        (at t3 x11 y12)
        (at t3 x12 y12)

        (at t4 x8 y6)
        (at t4 x9 y6)
        (at t4 x10 y6)

        (at t5 x5 y9)
        (at t5 x6 y9)
        (at t5 x7 y9)

        (at t6 x14 y9)
        (at t6 x14 y10)
        (at t6 x14 y11)
        
        (at t7 x8 y4)
        (at t7 x9 y4)
        (at t7 x10 y4)

        (occupied x3 y12)
        (occupied x9 y3)
        (occupied x12 y4)
        (occupied x6 y12)
        (occupied x9 y15)
        (occupied x13 y15)
        (occupied x10 y2)
        (occupied x4 y2)
        (occupied x4 y3)
        (occupied x8 y9)
        (occupied x9 y9)
        (occupied x14 y12)
        (occupied x15 y12)
        (occupied x6 y3)
        (occupied x6 y4)
        (occupied x14 y4)
        (occupied x15 y4)
        (occupied x6 y5)
        (occupied x7 y5)
        (occupied x1 y1)
        (occupied x1 y2)
        (occupied x7 y6)
        (occupied x7 y7)
        (occupied x7 y8)
        (occupied x11 y9)
        (occupied x11 y10)
        (occupied x11 y11)
        (occupied x10 y12)
        (occupied x11 y12)
        (occupied x12 y12)
        (occupied x8 y6)
        (occupied x9 y6)
        (occupied x10 y6)
        (occupied x5 y9)
        (occupied x6 y9)
        (occupied x7 y9)
        (occupied x14 y9)
        (occupied x14 y10)
        (occupied x14 y11)
        (occupied x8 y4)
        (occupied x9 y4)
        (occupied x10 y4)
        
    )

    (:goal
        (at m1 x3 y13)
    )

)