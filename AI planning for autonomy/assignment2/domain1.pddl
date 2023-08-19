(define (domain MakeTea)

    (:requirements
        :typing
    )

    (:types
        tapioca
        syrup
        ices
        teas
    )

    (:constants
        ;ice and tea do not have various types, so they are treated as constants
        ice - ices
        tea - teas
    )

    (:predicates
        (cup-exist)
        (iced)
        (ingredient-in-cup ?i)
        (tapioca-exist)
        (syrup-exist)
    )

    (:functions)

    (:action add-tapioca
        :parameters (?i - tapioca)
        :precondition (and 
            (not(tapioca-exist))
                      )
        :effect (and
            (ingredient-in-cup ?i)
            (tapioca-exist)
                )
    )
    
    (:action add-syrup
        :parameters (?i - syrup)
        :precondition (and
            (not(syrup-exist))
                      )
        :effect (and 
            (ingredient-in-cup ?i)
            (syrup-exist)
                )
    )
    
    (:action add-ice
        :parameters (?i - ices)
        :precondition (and 
            (not(ingredient-in-cup ?i))
                      )
        :effect (and
            (ingredient-in-cup ?i)
            (iced)
                )
    )
    
    (:action add-tea
        :parameters (?i - teas)
        :precondition (and 
            (not(ingredient-in-cup ?i))
                      )
        :effect (and 
            (ingredient-in-cup ?i)
                ) 
    )
)






