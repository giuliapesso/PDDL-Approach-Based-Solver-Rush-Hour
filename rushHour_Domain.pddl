(define (domain test)

    ;remove requirements that are not needed
    (:requirements :equality :disjunctive-preconditions :negative-preconditions :typing :conditional-effects
    )

    (:types
        vehicle position direction - object
        car truck motorcycle - vehicle
    )

    (:predicates
        (at ?v - vehicle ?p - position)
        (occupied ?p - position)
        (vertical ?p1 - position ?p2 - position)
        (horizontal ?p1 - position ?p2 - position)
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
        :parameters (?m - motorcycle ?p - position ?pDest - position)
        :precondition (and
            (at ?m ?p)
            (not (occupied ?pDest))
            (or (vertical ?p ?pDest) (vertical ?pDest ?p))
        )
        :effect (and

                
                    (at ?m ?pDest)
                    (occupied ?pDest)
                    (not (at ?m ?p))
                    (not (occupied ?p))
                
            
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
        :parameters (?m - motorcycle ?p - position ?pDest - position)
        :precondition (and
            (at ?m ?p)
            (not (occupied ?pDest))
            (or (horizontal ?p ?pDest) (horizontal ?pDest ?p))

        )
        :effect (and

            (at ?m ?pDest)
            (occupied ?pDest)
            (not (at ?m ?p))
            (not (occupied ?p))

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
        :parameters (?c - car ?p1 - position ?p2 - position ?pDest - position)
        :precondition (and
            (at ?c ?p1)
            (at ?c ?p2)
            (not (occupied ?pDest))
            (not (= ?p1 ?p2))
            (or (vertical ?p1 ?p2) (vertical ?p2 ?p1))
            (or (vertical ?p1 ?pDest) (vertical ?pDest ?p1) (vertical ?p2 ?pDest) (vertical ?pDest ?p2))

        )
        :effect (and

            (when
                (and
                    (or (vertical ?p1 ?pDest) (vertical ?pDest ?p1))
                )
                (and
                    (at ?c ?pDest)
                    (at ?c ?p1)
                    (occupied ?pDest)
                    (not (at ?c ?p2))
                    (not (occupied ?p2))
                )
            )

            (when
                (and
                    (or (vertical ?p2 ?pDest) (vertical ?pDest ?p2))
                )
                (and
                    (at ?c ?pDest)
                    (at ?c ?p2)
                    (occupied ?pDest)
                    (not (at ?c ?p1))
                    (not (occupied ?p1))
                )
            )

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
    ; - If there is an horizontal connection between ?p1 and ?p2, then the car will move horizontally. 
    ; - If there is an horizontal connection between ?p1 and ?pDest, then the car will be at ?pDest and ?p1 and will not be at ?p2 anymore.
    ; - If there is an horizontal connection between ?p2 and ?pDest, then the car will be at ?pDest and ?p2 and will not be at ?p1 anymore.

    (:action move-car-hor
        :parameters (?c - car ?p1 - position ?p2 - position ?pDest - position)
        :precondition (and
            (at ?c ?p1)
            (at ?c ?p2)
            (not (occupied ?pDest))
            (not (= ?p1 ?p2))
            (or (horizontal ?p1 ?p2) (horizontal ?p2 ?p1))
            (or (horizontal ?p1 ?pDest) (horizontal ?pDest ?p1) (horizontal ?p2 ?pDest) (horizontal ?pDest ?p2))

        )
        :effect (and
            (when
                
                    (or (horizontal ?p1 ?pDest) (horizontal ?pDest ?p1))
                
                (and
                    (at ?c ?pDest)
                    (at ?c ?p1)
                    (occupied ?pDest)
                    (not (at ?c ?p2))
                    (not (occupied ?p2))
                )
            )

            (when

                    (or (horizontal ?p2 ?pDest) (horizontal ?pDest ?p2))
                
                (and
                    (at ?c ?pDest)
                    (at ?c ?p2)
                    (occupied ?pDest)
                    (not (at ?c ?p1))
                    (not (occupied ?p1))
                )
            )

        )
    )

    ; Truck = 3 positions
    ; Parameters:
    ; - ?t : the truck to be moved
    ; - ?p1 ?p2 ?p3: the current positions of the truck
    ; - ?pDest : the position where the truck will be moved
    ;
    ; Precondition
    ; - The truck has to be in ?p1, ?p2 and ?p3
    ; - ?p1, ?p2 and ?p3 should be different
    ; - The position ?pDest should be free (not occupied)
    ;
    ; Effect
    ; - If there is an vertical connection between ?p and ?p2 and between ?p2 and ?p3, then the truck will move vertically. 
    ; - If there is an vertical connection between ?p1 and ?pDest, then the truck will be at ?pDest, ?p1 and ?p2 and will not be at ?p3 anymore.
    ; - If there is an vertical connection between ?p3 and ?pDest, then the truck will be at ?pDest, ?p3 and ?p2 and will not be at ?p1 anymore.

    (:action move-truck-ver
        :parameters (?t - truck ?p1 - position ?p2 - position ?p3 - position ?pDest - position)
        :precondition (and
            (at ?t ?p1)
            (at ?t ?p2)
            (at ?t ?p3)
            (not (occupied ?pDest))
            (not (= ?p1 ?p2))
            (not (= ?p2 ?p3))
            (not (= ?p1 ?p3))

            (or (vertical ?p1 ?p2) (vertical ?p2 ?p1))
            (or (vertical ?p2 ?p3) (vertical ?p3 ?p2))
            (or (vertical ?p1 ?pDest) (vertical ?pDest ?p1) (vertical ?p3 ?pDest) (vertical ?pDest ?p3))

        )
        :effect (and

            (when
          
                    (or (vertical ?p1 ?pDest) (vertical ?pDest ?p1))
                
                (and
                    (at ?t ?pDest)
                    (at ?t ?p1)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p3))
                    (not (occupied ?p3))
                )
            )

            (when
               
                    (or (vertical ?p3 ?pDest) (vertical ?pDest ?p3))
                
                (and
                    (at ?t ?pDest)
                    (at ?t ?p3)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p1))
                    (not (occupied ?p1))
                )
            )

        )
    )
    ; Truck = 3 positions
    ; Parameters:
    ; - ?t : the truck to be moved
    ; - ?p1 ?p2 ?p3: the current positions of the truck
    ; - ?pDest : the position where the truck will be moved
    ;
    ; Precondition
    ; - The truck has to be in ?p1, ?p2 and ?p3
    ; - ?p1, ?p2 and ?p3 should be different
    ; - The position ?pDest should be free (not occupied)
    ;
    ; Effect
    ; - If there is an horizontal connection between ?p1 and ?p2 and between ?p2 and ?p3, then the truck will move horizontally. 
    ; - If there is an horizontal connection between ?p1 and ?pDest, then the truck will be at ?pDest, ?p1 and ?p2 and will not be at ?p3 anymore.
    ; - If there is an horizontal connection between ?p3 and ?pDest, then the truck will be at ?pDest, ?p3 and ?p2 and will not be at ?p1 anymore.

    (:action move-truck
        :parameters (?t - truck ?p1 - position ?p2 - position ?p3 - position ?pDest - position)
        :precondition (and
            (at ?t ?p1)
            (at ?t ?p2)
            (at ?t ?p3)
            (not (occupied ?pDest))
            (not (= ?p1 ?p2))
            (not (= ?p2 ?p3))
            (not (= ?p1 ?p3))
            (or (horizontal ?p1 ?p2) (horizontal ?p2 ?p1))
            (or (horizontal ?p2 ?p3) (horizontal ?p3 ?p2))
            (or (horizontal ?p1 ?pDest) (horizontal ?pDest ?p1) (horizontal ?p3 ?pDest) (horizontal ?pDest ?p3))
        )
        :effect (and
            (when
         
                    (or (horizontal ?p1 ?pDest) (horizontal ?pDest ?p1))
                
                (and
                    (at ?t ?pDest)
                    (at ?t ?p1)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p3))
                    (not (occupied ?p3))
                )
            )

            (when
             
                    (or (horizontal ?p3 ?pDest) (horizontal ?pDest ?p3))
                
                (and
                    (at ?t ?pDest)
                    (at ?t ?p3)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p1))
                    (not (occupied ?p1))
                )
            )
        )
    )

)