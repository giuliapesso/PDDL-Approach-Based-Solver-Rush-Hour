(define (domain domainXY)

    (:requirements :equality :disjunctive-preconditions :negative-preconditions :typing :conditional-effects
    )

    (:types
        vehicle position direction - object
        car truck motorcycle - vehicle
    )

    (:predicates
        (at ?v - vehicle ?x - position ?y - position)
        (occupied ?x - position ?y - position)
        (next ?b - position ?a - position) ; ?b is the next hop of ?a (next hop = next coordinate)
    )

    ; Motorcycle = 1 position
    ; Parameters:
    ; - ?m : the motorcycle to be moved
    ; - ?x ?y : the current position of the motorcycle
    ; - ?xDest : the x coordinate where the motorcycle will be moved
    ;
    ; Precondition
    ; - The motorcycle has to be in ?x ?y
    ; - The position ?xDest ?y should be free (not occupied)
    ; - If ?xDest is the next hop pf ?x, the motorcycle will move down;
    ; - If ?x is the next hop of ?xDest, the motorcycle will move up;
    ;
    ; Effects:
    ; - The motorcycle will be at ?xDest ?y, which results to be occupied, 
    ;   and will not be at ?x ?y, which will be not occupied.

    (:action move-motorcycle-ver
        :parameters (?m - motorcycle ?y - position ?x - position ?xDest - position)
        :precondition (and
            (at ?m ?x ?y)
            (not (occupied ?xDest ?y))
            (or 
                (next ?xDest ?x) ; The motorcycle will move up
                (next ?x ?xDest) ; The motorcycle will move down
            )
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
    ; - ?x ?y : the current position of the motorcycle
    ; - ?yDest : the y coordinate where the motorcycle will be moved
    ;
    ; Precondition
    ; - The motorcycle has to be in ?x ?y
    ; - The position ?x ?yDest should be free (not occupied)
    ; - If ?yDest is the next hop of ?y, the motorcycle will move right;
    ; - If ?y is the next hop of ?yDest, the motorcycle will move left;
    ;
    ; Effects:
    ; - The motorcycle will be at ?x ?yDest, which results to be occupied.
    ;   It won't be at ?x ?y anymore, so it will result to be free (not occupied).

    (:action move-motorcycle-hor
        :parameters (?m - motorcycle ?x - position ?y - position ?yDest - position)
        :precondition (and
            (at ?m ?x ?y)
            (not (occupied ?x ?yDest))
            (or 
                (next ?yDest ?y) ; The motorcycle will move to the left
                (next ?y ?yDest) ; The motorcycle will move to the right
            )

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
    ; - ?x1 ?y and ?x2 ?y : the current positions of the car
    ; - ?xDest : the x coordinate where the car will be moved
    ;
    ; Precondition
    ; - The car has to be in ?x1 ?y and ?x2 ?y 
    ; - ?x1 and ?x2 should be different
    ; - The position ?xDest ?y should be free (not occupied)
    ; - Next hop of ?x1 has to be ?x2
    ; - If ?x1 is the next hop of ?xDest, the car will move up
    ; - If ?xDest is the next hop of ?x2, the car will move down
    ;
    ; Effects:
    ; - If the car is moving up, it will be at ?xDest ?y and ?x1 ?y, which result to be occupied. 
    ;   It won't be at ?x2 ?y anymore, so it will result to be free (not occupied).
    ; - If the car is moving down, it will be at ?xDest ?y and ?x2 ?y, which result to be occupied. 
    ;   It won't be at ?x1 ?y anymore, so it will result to be free (not occupied).

    (:action move-car-ver
        :parameters (?c - car ?y - position ?x1 - position ?x2 - position ?xDest - position)
        :precondition (and
            (at ?c ?x1 ?y)
            (at ?c ?x2 ?y)
            (not (occupied ?xDest ?y))
            (not (= ?x1 ?x2))
            (next ?x2 ?x1) 
            (or (next ?x1 ?xDest) (next ?xDest ?x2))

        )
        :effect (and

            (when
                (and
                    (next ?x1 ?xDest) ; The car will move up
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
                    (next ?xDest ?x2) ; The car will move down
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
    
    ; Car = 2 positions
    ; Parameters:
    ; - ?c : the car to be moved
    ; - ?x ?y1 and ?x ?y2 : the current positions of the car
    ; - ?yDest : the x coordinate where the car will be moved
    ;
    ; Precondition
    ; - The car has to be in ?x ?y1 and ?x ?y2
    ; - ?y1 and ?y2 should be different
    ; - The position ?x ?yDest should be free (not occupied)
    ; - Next hop of ?y1 has to be ?y2
    ; - If ?y1 is the next hop of ?yDest, the car will move left
    ; - If ?yDest is the next hop of ?y2, the car will move right
    ;
    ; Effects:
    ; - If the car is moving left, it will be at ?x ?yDest and ?x ?y1, which result to be occupied. 
    ;   It won't be at ?x ?y2 anymore, so it will result to be free (not occupied).
    ; - If the car is moving right, it will be at ?x ?yDest and ?x ?y2, which result to be occupied. 
    ;   It won't be at ?x ?y1 anymore, so it will result to be free (not occupied).

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
                (and (next ?y1 ?yDest)) ; The car will move to the left
                (and
                    (at ?c ?x ?yDest)
                    (at ?c ?x ?y1)
                    (occupied ?x ?yDest)
                    (not (at ?c ?x ?y2))
                    (not (occupied ?x ?y2))
                )
            )

            (when
                (and (next ?yDest ?y2)) ; The car will move to the right
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

    ; Truck = 3 positions
    ; Parameters:
    ; - ?t : the truck to be moved
    ; - ?x1 ?y and ?x2 ?y and ?x3 ?y: the current positions of the truck
    ; - ?xDest : the x coordinate where the truck will be moved
    ; 
    ; Precondition
    ; - The truck has to be in ?x1 ?y and ?x2 ?y and ?x3 ?y
    ; - ?x1, ?x2 and ?x3 should be different
    ; - The position ?xDest ?y should be free (not occupied)
    ; - Next hop of ?x1 has to be ?x2 and next hop of ?x2 has to be ?x3
    ; - If ?x1 is the next hop of ?xDest, the truck will move up
    ; - If ?xDest is the next hop of ?x3, the truck will move down 
    ; 
    ; Effect
    ; - If the truck is moving up, it will be at ?xDest ?y, ?x1 ?y and ?x2 ?y, which result to be occupied. 
    ;   It won't be at ?x3 ?y anymore, so it will result to be free (not occupied).
    ; - If the truck is moving down, it will be at ?xDest ?y, ?x3 ?y and ?x2 ?y, which result to be occupied. 
    ;   It won't be at ?x1 ?y anymore, so it will result to be free (not occupied).

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
                (and (next ?x1 ?xDest)) ; The truck will move up

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

                (and (next ?xDest ?x3)) ; The truck will move down

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
    
    ; Truck = 3 positions
    ; Parameters:
    ; - ?t : the truck to be moved
    ; - ?x ?y1 and ?x ?y2 and ?x ?y3: the current positions of the truck
    ; - ?yDest : the x coordinate where the truck will be moved
    ; 
    ; Precondition
    ; - The truck has to be in ?x ?y1 and ?x ?y2 and ?x ?y3
    ; - ?y1, ?y2 and ?y3 should be different
    ; - The position ?x ?yDest should be free (not occupied)
    ; - Next hop of ?y1 has to be ?y2 and next hop of ?y2 has to be ?y3
    ; - If ?y1 is the next hop of ?yDest, the truck will move left
    ; - If ?yDest is the next hop of ?y3, the truck will move right 
    ; 
    ; Effect
    ; - If the truck is moving left, it will be at ?x ?yDest, ?x ?y1 and ?x ?y2, which result to be occupied. 
    ;   It won't be at ?x ?y3 anymore, so it will result to be free (not occupied).
    ; - If the truck is moving right, it will be at ?x ?yDest, ?x ?y3 and ?x ?y2, which result to be occupied. 
    ;   It won't be at ?x ?y1 anymore, so it will result to be free (not occupied).

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

                (and (next ?y1 ?yDest)) ; The truck will move to the left

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

                (and (next ?yDest ?y3)) ; The truck will move to the right

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
