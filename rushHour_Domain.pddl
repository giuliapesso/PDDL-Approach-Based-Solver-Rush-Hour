(define (domain test)

;remove requirements that are not needed
    (:requirements 
        :equality 
        :disjunctive-preconditions 
        :negative-preconditions 
        :typing
        :conditional-effects
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

    (:action move-motorcycle
        :parameters (?m - motorcycle ?p - position ?pDest - position)
        :precondition (and 
            (at ?m ?p)
            (not (occupied ?pDest))
        )
        :effect (and 
            (when (or (horizontal ?p ?pDest) (horizontal ?pDest ?p))
                (and
                    (at ?m ?pDest)
                    (occupied ?pDest)
                    (not (at ?m ?p))
                    (not (occupied ?p))
                )
            )

            (when (or (vertical ?p ?pDest) (vertical ?pDest ?p))
                (and
                    (at ?m ?pDest)
                    (occupied ?pDest)
                    (not (at ?m ?p))
                    (not (occupied ?p))
                )
            )

        )
    )

    (:action move-car
        :parameters (?c - car ?p1 - position ?p2 - position ?pDest - position)
        :precondition (and 
            (at ?c ?p1)
            (at ?c ?p2)
            (not (occupied ?pDest))
            (not (= ?p1 ?p2))
        )
        :effect (and 
            (when (and 
                    (or (horizontal ?p1 ?p2) (horizontal ?p2 ?p1)) 
                    (or (horizontal ?p1 ?pDest) (horizontal ?pDest ?p1))
                )
                (and
                    (at ?c ?pDest)
                    (at ?c ?p1)
                    (occupied ?pDest)
                    (not (at ?c ?p2))
                    (not (occupied ?p2))
                )
            )

            (when (and 
                    (or (horizontal ?p1 ?p2) (horizontal ?p2 ?p1)) 
                    (or (horizontal ?p2 ?pDest) (horizontal ?pDest ?p2))
                )
                (and
                    (at ?c ?pDest)
                    (at ?c ?p2)
                    (occupied ?pDest)
                    (not (at ?c ?p1))
                    (not (occupied ?p1))
                )
            )

            (when (and 
                    (or (vertical ?p1 ?p2) (vertical ?p2 ?p1)) 
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

            (when (and 
                    (or (vertical ?p1 ?p2) (vertical ?p2 ?p1)) 
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
        )
        :effect (and 
            (when (and  
                    (and 
                        (or (horizontal ?p1 ?p2) (horizontal ?p2 ?p1))
                        (or (horizontal ?p2 ?p3) (horizontal ?p3 ?p2))
                    )
                    (or (horizontal ?p1 ?pDest) (horizontal ?pDest ?p1))
                )
                (and
                    (at ?t ?pDest)
                    (at ?t ?p1)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p3))
                    (not (occupied ?p3))
                )
            )

            (when (and  
                    (and 
                        (or (horizontal ?p1 ?p2) (horizontal ?p2 ?p1))
                        (or (horizontal ?p2 ?p3) (horizontal ?p3 ?p2))
                    )
                    (or (horizontal ?p3 ?pDest) (horizontal ?pDest ?p3))
                )
                (and
                    (at ?t ?pDest)
                    (at ?t ?p3)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p1))
                    (not (occupied ?p1))
                )
            )

            (when (and  
                    (and 
                        (or (vertical ?p1 ?p2) (vertical ?p2 ?p1))
                        (or (vertical ?p2 ?p3) (vertical ?p3 ?p2))
                    )
                    (or (vertical ?p1 ?pDest) (vertical ?pDest ?p1))
                )
                (and
                    (at ?t ?pDest)
                    (at ?t ?p1)
                    (at ?t ?p2)
                    (occupied ?pDest)
                    (not (at ?t ?p3))
                    (not (occupied ?p3))
                )
            )

            (when (and  
                    (and 
                        (or (vertical ?p1 ?p2) (vertical ?p2 ?p1))
                        (or (vertical ?p2 ?p3) (vertical ?p3 ?p2))
                    )
                    (or (vertical ?p3 ?pDest) (vertical ?pDest ?p3))
                )
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