(define (domain domainName)



    (:types
        macchina
        posizione

    )
    ;ciao giulia prova modifica
    ;prova gamo brewewanch


    (:predicates
        (at ?x - macchina ?p - posizione)
        (occ ?p - posizione)
        (hor ?p1 - posizione ?p2 - posizione)
        (haRagg ?p - posizione)
        
    
    )

    

    (:action move
        :parameters (?m - macchina ?p1 - posizione ?p2 - posizione ?pDest - posizione)
        :precondition (and 
            (at ?m ?p1)
            (at ?m ?p2)
            (not (occ ?pDest))
            (or (hor ?p1 ?p2) (hor ?p2 ?p1))
            (or (hor ?pDest ?p2) (hor ?p2 ?pDest)
             (hor ?p1 ?pDest) (hor ?pDest ?p1))
            
            
            
            
            )
        :effect (
            
            
            and
            (when (and (or(hor ?p1 ?pDest) (hor ?pDest ?p1)))
                (and
                    (at ?m ?pDest)
                    (at ?m ?p1)
                    (not (at ?m ?p2))
                    (haRagg ?pDest)
                )
            )
            (when (and (or(hor ?p2 ?pDest) (hor ?pDest ?p2)))
                (and
                    (at ?m ?pDest)
                    (at ?m ?p2)
                    (not (at ?m ?p1))
                    (haRagg ?pDest)
                )
            )
           
            
                
        
        )
    )
)