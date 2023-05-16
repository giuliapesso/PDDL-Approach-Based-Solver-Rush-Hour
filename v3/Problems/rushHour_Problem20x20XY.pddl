(define (problem problem10x10) (:domain domainXY)

    ; ------------------------------------------------------------------------------------
    ;     1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20
    ; 1 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 2 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 3 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 4 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 5 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 6 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 7 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 8 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 9 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 10|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 11|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 12|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 13|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 14|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 15|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 16|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   
    ; 17|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 18|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 19|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; 20|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
    ; -------------------------------------------------------------------------------------

    (:objects
        m1 m2 m3 m4 m5 m6 m7 - motorcycle
        c1 c2 c3 c4 c5 c6 red - car
        t1 t2 t3 t4 - truck
        x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 y16 y17 y18 y19 y20 - position
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
        (next y11 y10)
        (next y12 y11)
        (next y13 y12)
        (next y14 y13)
        (next y15 y14)
        (next y16 y15)
        (next y17 y16)
        (next y18 y17)
        (next y19 y18)
        (next y20 y19)

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
        (next x16 x15)
        (next x17 x16)
        (next x18 x17)
        (next x19 x18)
        (next x20 x19)
        
    
        (at m1 x9 y3)
        (at m2 x3 y2)
        (at m3 x2 y3)
        (at m4 x3 y6)
        (at m5 x6 y9)
        (at m6 x2 y8)
        (at m7 x9 y8)

        (at c1 x6 y3)
        (at c1 x6 y4)

        (at c2 x6 y5)
        (at c2 x7 y5)

        (at c3 x7 y6)
        (at c3 x7 y7)

        (at c4 x5 y6)
        (at c4 x6 y6)

        (at c5 x4 y4)
        (at c5 x4 y5)
        
        (at c6 x4 y9)
        (at c6 x4 y10)

        (at red x5 y4)
        (at red x5 y5)
        
        
        
        (at t1 x3 y3)
        (at t1 x4 y3)
        (at t1 x5 y3)

        (at t2 x4 y6)
        (at t2 x4 y7)
        (at t2 x4 y8)

        (at t3 x6 y8)
        (at t3 x7 y8)
        (at t3 x8 y8)

        (at t4 x9 y5)
        (at t4 x9 y6)
        (at t4 x9 y7)

        (occupied x9 y3)
        (occupied x3 y2)
        (occupied x2 y3)
        (occupied x3 y6)
        (occupied x6 y9)
        (occupied x2 y8)
        (occupied x9 y8)
        (occupied x6 y3)
        (occupied x6 y4)
        (occupied x6 y5)
        (occupied x7 y5)
        (occupied x7 y6)
        (occupied x7 y7)
        (occupied x5 y6)
        (occupied x6 y6)
        (occupied x4 y4)
        (occupied x4 y5)
        (occupied x4 y9)
        (occupied x4 y10)
        (occupied x5 y4)
        (occupied x5 y5)
        (occupied x3 y3)
        (occupied x4 y3)
        (occupied x5 y3)
        (occupied x4 y6)
        (occupied x4 y7)
        (occupied x4 y8)
        (occupied x6 y8)
        (occupied x7 y8)
        (occupied x8 y8)
        (occupied x9 y5)
        (occupied x9 y6)
        (occupied x9 y7)

    )

    (:goal
        (at red x5 y9)
    )

)