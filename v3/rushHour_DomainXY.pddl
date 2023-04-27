(define (domain domainXY)

    ;remove requirements that are not needed
    (:requirements :equality :disjunctive-preconditions :negative-preconditions :typing :conditional-effects
    )

    (:types
        vehicle position direction - object
        car truck motorcycle - vehicle
    )

    (:predicates
        (at ?v - vehicle ?x - position ?y - position)
        (occupied ?x - position ?y - position)
        (next ?next - position ?pre - position) ; Per dire che x2 viene dopo x1, (next x2 x1)
    )

    ; Motorcycle = 1 position
    ; Parameters:
    ; - ?m : the motorcycle to be moved
    ; - ?p : the current position of the motorcycle
    ; - ?pDest : the position where the motorcycle will be moved
    ;
    ; Precondition
    ; - The motorcycle has to be in ?p
    ; - The position ?pDest should be free (not occupied)
    ;
    ; Effect
    ; - If there is an vertical connection between ?p and ?pDest, then the motorcycle will move vertically. 
    ; - The motorcycle will be at ?pDest, which results to be occupied, and will not be art ?p, which will be not occupied.
    (:action move-motorcycle-ver
        :parameters (?m - motorcycle ?x - position ?y - position ?xDest - position)
        :precondition (and
            (at ?m ?x ?y)
            (not (occupied ?xDest ?y))
            (or (next ?xDest ?x) (next ?x ?xDest))
        )
        :effect (and
            (at ?m ?xDest ?y)
            (occupied ?xDest ?y)
            (not (at ?m ?x ?y))
            (not (occupied ?x ?y))
        )
    )
    ; Motorcycle = 1 position
    ; Parameters:
    ; - ?m : the motorcycle to be moved
    ; - ?p : the current position of the motorcycle
    ; - ?pDest : the position where the motorcycle will be moved
    ;
    ; Precondition
    ; - The motorcycle has to be in ?p
    ; - The position ?pDest should be free (not occupied)
    ;
    ; Effect
    ; - If there is an horizontal connection between ?p and ?pDest, then the motorcycle will move horizontally. 
    ; - The motorcycle will be at ?pDest, which results to be occupied, and will not be art ?p, which will be not occupied.
    (:action move-motorcycle-hor
        :parameters (?m - motorcycle ?x - position ?y - position ?yDest - position)
        :precondition (and
            (at ?m ?x ?y)
            (not (occupied ?x ?yDest))
            (or (next ?yDest ?y) (next ?y ?yDest))

        )
        :effect (and
            (at ?m ?x ?yDest)
            (occupied ?x ?yDest)
            (not (at ?m ?x ?y))
            (not (occupied ?x ?y))
        )
    )

    ; Car = 2 positions
    ; Parameters:
    ; - ?c : the car to be moved
    ; - ?p1 ?p2 : the current position of the car
    ; - ?pDest : the position where the car will be moved
    ;
    ; Precondition
    ; - The car has to be in ?p1 and ?p2
    ; - ?p1 and ?p2 should be different
    ; - The position ?pDest should be free (not occupied)
    ;
    ; Effect
    ; - If there is an vertical connection between ?p and ?p2, then the car will move vertically. 
    ; - If there is an vertical connection between ?p1 and ?pDest, then the car will be at ?pDest and ?p1 and will not be at ?p2 anymore.
    ; - If there is an vertical connection between ?p2 and ?pDest, then the car will be at ?pDest and ?p2 and will not be at ?p1 anymore.

    (:action move-car-ver
        :parameters (?c - car ?y - position ?x1 - position ?x2 - position ?xDest - position)
        :precondition (and
            (at ?c ?x1 ?y)
            (at ?c ?x2 ?y)
            (not (occupied ?xDest ?y))
            (not (= ?x1 ?x2))
            (next ?x2 ?x1) ;(next ?p2 ?p1))
            (or (next ?x1 ?xDest) (next ?xDest ?x2))

        )
        :effect (and

            (when
                (and
                    (next ?x1 ?xDest) ; Up 
                )
                (and
                    (at ?c ?xDest ?y)
                    (at ?c ?x1 ?y)
                    (occupied ?xDest ?y)
                    (not (at ?c ?x2 ?y))
                    (not (occupied ?x2 ?y))
                )
            )

            (when
                (and
                    (next ?xDest ?x2) ; Down
                )
                (and
                    (at ?c ?xDest ?y)
                    (at ?c ?x2 ?y)
                    (occupied ?xDest ?y)
                    (not (at ?c ?x1 ?y))
                    (not (occupied ?x1 ?y))
                )
            )

        )
    )
    
    ; ; Car = 2 positions
    ; ; Parameters:
    ; ; - ?c : the car to be moved
    ; ; - ?p1 ?p2 : the current position of the car
    ; ; - ?pDest : the position where the car will be moved
    ; ;
    ; ; Precondition
    ; ; - The car has to be in ?p1 and ?p2
    ; ; - ?p1 and ?p2 should be different
    ; ; - The position ?pDest should be free (not occupied)
    ; ;
    ; ; Effect
    ; ; - If there is an horizontal connection between ?p1 and ?p2, then the car will move horizontally. 
    ; ; - If there is an horizontal connection between ?p1 and ?pDest, then the car will be at ?pDest and ?p1 and will not be at ?p2 anymore.
    ; ; - If there is an horizontal connection between ?p2 and ?pDest, then the car will be at ?pDest and ?p2 and will not be at ?p1 anymore.

    (:action move-car-hor
        :parameters (?c - car ?x - position ?y1 - position ?y2 - position ?yDest - position)
        :precondition (and
            (at ?c ?x ?y1)
            (at ?c ?x ?y2)
            (not (occupied ?x ?yDest))
            (not (= ?y1 ?y2))
            (next ?y2 ?y1)
            (or (next ?y1 ?yDest) (next ?yDest ?y2))

        )
        :effect (and
            (when
                (and (next ?y1 ?yDest)) ; Left
                (and
                    (at ?c ?x ?yDest)
                    (at ?c ?x ?y1)
                    (occupied ?x ?yDest)
                    (not (at ?c ?x ?y2))
                    (not (occupied ?x ?y2))
                )
            )

            (when
                (and (next ?yDest ?y2)) ; Right
                (and
                    (at ?c ?x ?yDest)
                    (at ?c ?x ?y2)
                    (occupied ?x ?yDest)
                    (not (at ?c ?x ?y1))
                    (not (occupied ?x ?y1))
                )
            )

        )
    )

    ; ; Truck = 3 positions
    ; ; Parameters:
    ; ; - ?t : the truck to be moved
    ; ; - ?p1 ?p2 ?p3: the current positions of the truck
    ; ; - ?pDest : the position where the truck will be moved
    ; ;
    ; ; Precondition
    ; ; - The truck has to be in ?p1, ?p2 and ?p3
    ; ; - ?p1, ?p2 and ?p3 should be different
    ; ; - The position ?pDest should be free (not occupied)
    ; ;
    ; ; Effect
    ; ; - If there is an vertical connection between ?p and ?p2 and between ?p2 and ?p3, then the truck will move vertically. 
    ; ; - If there is an vertical connection between ?p1 and ?pDest, then the truck will be at ?pDest, ?p1 and ?p2 and will not be at ?p3 anymore.
    ; ; - If there is an vertical connection between ?p3 and ?pDest, then the truck will be at ?pDest, ?p3 and ?p2 and will not be at ?p1 anymore.

    (:action move-truck-ver
        :parameters (?t - truck ?y - position ?x1 - position ?x2 - position ?x3 - position ?xDest - position)
        :precondition (and
            (at ?t ?x1 ?y)
            (at ?t ?x2 ?y)
            (at ?t ?x3 ?y)
            (not (occupied ?xDest ?y))
            (not (= ?x1 ?x2))
            (not (= ?x2 ?x3))
            (not (= ?x1 ?x3))

            (and (next ?x2 ?x1) (next ?x3 ?x2))
            (or (next ?x1 ?xDest) (next ?xDest ?x3))

        )
        :effect (and

            (when
                (and (next ?x1 ?xDest)) ; Up

                (and
                    (at ?t ?xDest ?y)
                    (at ?t ?x1 ?y)
                    (at ?t ?x2 ?y)
                    (occupied ?xDest ?y)
                    (not (at ?t ?x3 ?y))
                    (not (occupied ?x3 ?y))
                )
            )

            (when

                (and (next ?xDest ?x3)) ; Down

                (and
                    (at ?t ?xDest ?y)
                    (at ?t ?x3 ?y)
                    (at ?t ?x2 ?y)
                    (occupied ?xDest ?y)
                    (not (at ?t ?x1 ?y))
                    (not (occupied ?x1 ?y))
                )
            )

        )
    )
    
    ; ; Truck = 3 positions
    ; ; Parameters:
    ; ; - ?t : the truck to be moved
    ; ; - ?p1 ?p2 ?p3: the current positions of the truck
    ; ; - ?pDest : the position where the truck will be moved
    ; ;
    ; ; Precondition
    ; ; - The truck has to be in ?p1, ?p2 and ?p3
    ; ; - ?p1, ?p2 and ?p3 should be different
    ; ; - The position ?pDest should be free (not occupied)
    ; ;
    ; ; Effect
    ; ; - If there is an horizontal connection between ?p1 and ?p2 and between ?p2 and ?p3, then the truck will move horizontally. 
    ; ; - If there is an horizontal connection between ?p1 and ?pDest, then the truck will be at ?pDest, ?p1 and ?p2 and will not be at ?p3 anymore.
    ; ; - If there is an horizontal connection between ?p3 and ?pDest, then the truck will be at ?pDest, ?p3 and ?p2 and will not be at ?p1 anymore.

    (:action move-truck-hor
        :parameters (?t - truck ?x - position ?y1 - position ?y2 - position ?y3 - position ?yDest - position)
        :precondition (and
            (at ?t ?x ?y1)
            (at ?t ?x ?y2)
            (at ?t ?x ?y3)
            (not (occupied ?x ?yDest))
            (not (= ?y1 ?y2))
            (not (= ?y2 ?y3))
            (not (= ?y1 ?y3))
            (and (next ?y2 ?y1) (next ?y3 ?y2))
            (or (next ?y1 ?yDest) (next ?yDest ?y3))
        )
        :effect (and
            (when

                (and (next ?y1 ?yDest)) ; Left

                (and
                    (at ?t ?x ?yDest)
                    (at ?t ?x ?y1)
                    (at ?t ?x ?y2)
                    (occupied ?x ?yDest)
                    (not (at ?t ?x ?y3))
                    (not (occupied ?x ?y3))
                )
            )

            (when

                (and (next ?yDest ?y3)) ; Right

                (and
                    (at ?t ?x ?yDest)
                    (at ?t ?x ?y3)
                    (at ?t ?x ?y2)
                    (occupied ?x ?yDest)
                    (not (at ?t ?x ?y1))
                    (not (occupied ?x ?y1))
                )
            )
        )
    )

)