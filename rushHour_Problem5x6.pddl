(define (problem problem_name)
    (:domain test)
    (:objects
        m1 - motorcycle
        c1 c2 red - car
        t1 t2 - truck
        p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 - position
    )

    (:init
        (horizontal p1 p2)(horizontal p2 p3)(horizontal p3 p4)(horizontal p4 p5)
        (horizontal p6 p7)(horizontal p7 p8)(horizontal p8 p9)(horizontal p9 p10)
        (horizontal p11 p12)(horizontal p12 p13)(horizontal p13 p14)(horizontal p14 p15)
        (horizontal p16 p17)(horizontal p17 p18)(horizontal p18 p19)(horizontal p19 p20)
        (horizontal p21 p22)(horizontal p22 p23)(horizontal p23 p24)(horizontal p24 p25)
        (horizontal p26 p27)(horizontal p27 p28)(horizontal p28 p29)(horizontal p29 p30)

        (vertical p1 p6)(vertical p2 p7)(vertical p3 p8)(vertical p4 p9)(vertical p5 p10)
        (vertical p6 p11)(vertical p7 p12)(vertical p8 p13)(vertical p9 p14)(vertical p10 p15)
        (vertical p11 p16)(vertical p12 p17)(vertical p13 p18)(vertical p14 p19)(vertical p15 p20)
        (vertical p16 p21)(vertical p17 p22)(vertical p18 p23)(vertical p19 p24)(vertical p20 p25)
        (vertical p21 p26)(vertical p22 p27)(vertical p28 p23)(vertical p29 p24)(vertical p30 p25)

        (at t1 p14)
        (at t1 p19)
        (at t1 p24)

        (at t2 p1)
        (at t2 p2)
        (at t2 p3)

        ; (at red p11)
        ; (at red p12)

        ; (at c1 p8)
        ; (at c1 p13)

        ; (at c2 p10)
        ; (at c2 p15)

        ; (at m1 p29)

        ; (occupied p10)
        ; (occupied p15) 
        (occupied p14)
        (occupied p19)
        (occupied p24)
        ; (occupied p11)
        ; (occupied p12)
        ; (occupied p8)
        ; (occupied p13)
        ; (occupied p29)
        (occupied p1)
        (occupied p2)
        (occupied p3)
    )

    (:goal
        (and
            ;(at red p15)
            (at t1 p9)
        )
    )

)