(define (domain MakeHeatedMixedTea)

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
        (tapioca-exist)
        (syrup-exist)
        (iced)
        (heated ?i)
        (mixed)
        (ingredient-in-cup ?i)
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
    
    (:action heat-ingredients
        ;no parameter since modelling situation of the entire cup
        :parameters ()
        :precondition (and
            (cup-exist)
                      )
        :effect (and 
            ;effect after heating iced tea
            (when(ingredient-in-cup ice)(and(not(ingredient-in-cup ice))(not(iced))))
            
            ;effect after heating un-iced ingredients, such as tea, tapioca and syrup
            ;effect after heating tea
            (when(and(not(ingredient-in-cup ice))(ingredient-in-cup tea))(heated tea))
            ;effect after heating tapioca, and effect applies to all kinds of tapioca
            (forall(?i - tapioca)
                (when(and(not(ingredient-in-cup ice))(ingredient-in-cup ?i))(heated ?i))
            )
            ;effect after heating syrup, and effect applies to all kinds of syrup
            (forall(?i - syrup)
                (when(and(not(ingredient-in-cup ice))(ingredient-in-cup ?i))(heated ?i))
            )            
                ) 
    )

    (:action mix-ingredients
        ;no parameter since modelling situation of the entire cup
        :parameters ()
        :precondition (and 
            (cup-exist)
                      )
        :effect (and 
            ;no more unheated tapioca ball after mixing it
            (forall(?i - tapioca)
                (when(and(tapioca-exist)(not(heated ?i)))(not(tapioca-exist)))
            )
            
            ;the drink is now mixed by mixing tea and syrup
            (when(and(ingredient-in-cup tea)(syrup-exist))(mixed))
            
            ;the drink is now mixed by mixing unheated tapioca into syrup
            ;assume certain flavour of unheated tapioca turns to exactly the same flavour of syrup by mixing
            (forall(?i - tapioca ?j - syrup)
                (when(and(ingredient-in-cup ?i)(not(heated ?i)))(and(not(ingredient-in-cup ?i))(ingredient-in-cup ?j)))
            )
            
            ;the following statement does not generalzie to all kinds of tapioca and syrup, but keep it to show my idea is derived from here
            ;(when(and(ingredient-in-cup mango-tapioca)(not(heated mango-tapioca)))(and(not(ingredient-in-cup mango-tapioca))(ingredient-in-cup mango-syrup)))
            ;(when(and(ingredient-in-cup lime-tapioca)(not(heated lime-tapioca)))(and(not(ingredient-in-cup lime-tapioca))(ingredient-in-cup lime-syrup)))
                ) 
    )
)






