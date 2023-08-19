(define (domain MakeTwoCupTea)

    (:requirements
        :typing
    )

    (:types
        tapioca
        syrup
        ices
        teas
        cup
    )

    (:constants
        ;ice and tea do not have various types, so they are treated as constants
        ice - ices
        tea - teas
    )

    (:predicates
        ;add one more parameter to each applicable predicate to account for cups
        (cup-exist ?c - cup)
        (tapioca-exist)
        (syrup-exist)
        (iced ?c - cup)
        (heated ?i ?c)
        (mixed ?c - cup)
        (ingredient-in-cup ?i ?c)
        (heated-cup ?c - cup)
    )

    (:functions)

    (:action add-tapioca
        :parameters (?i - tapioca ?c - cup)
        :precondition (and 
            (not(tapioca-exist))
                      )
        :effect (and
            (ingredient-in-cup ?i ?c)
            (tapioca-exist)
                )
    )
    
    (:action add-syrup
        :parameters (?i - syrup ?c - cup)
        :precondition (and
            (not(syrup-exist))
                      )
        :effect (and 
            (ingredient-in-cup ?i ?c)
            (syrup-exist)
                )
    )
    
    (:action add-ice
        :parameters (?i - ices ?c - cup)
        :precondition (and 
            (not(ingredient-in-cup ?i ?c))
                      )
        :effect (and
            (ingredient-in-cup ?i ?c)
            (iced ?c)
                )
    )
    
    (:action add-tea
        :parameters (?i - teas ?c - cup)
        :precondition (and 
            (not(ingredient-in-cup ?i ?c))
                      )
        :effect (and 
            (ingredient-in-cup ?i ?c)
                ) 
    )
    
    (:action heat-ingredients
        :parameters (?c - cup)
        :precondition (and
            (cup-exist ?c)
                      )
        :effect (and 
            ;hot cup
            (heated-cup ?c)
            
            ;effect after heating iced tea
            (when(ingredient-in-cup ice ?c)(and(not(ingredient-in-cup ice ?c))(not(iced ?c))))
            
            ;effect after heating un-iced ingredients, such as tea, tapioca and syrup
            ;effect after heating tea
            (when(and(not(ingredient-in-cup ice ?c))(ingredient-in-cup tea ?c))(heated tea ?c))
            ;effect after heating tapioca, and effect applies to all kinds of tapioca
            (forall(?i - tapioca)
                (when(and(not(ingredient-in-cup ice ?c))(ingredient-in-cup ?i ?c))(heated ?i ?c))
            )
            ;effect after heating syrup, and effect applies to all kinds of syrup
            (forall(?i - syrup)
                (when(and(not(ingredient-in-cup ice ?c))(ingredient-in-cup ?i ?c))(heated ?i ?c))
            )            
                ) 
    )

    (:action mix-ingredients
        :parameters (?c - cup)
        :precondition (and 
            (cup-exist ?c)
                      )
        :effect (and 
            ;no more unheated tapioca ball after mixing it
            (forall(?i - tapioca)
                (when(and(tapioca-exist)(not(heated ?i ?c)))(not(tapioca-exist)))
            )
            
            ;the drink is now mixed by mixing tea and syrup
            (when(and(ingredient-in-cup tea ?c)(syrup-exist))(mixed ?c))
            
            ;the drink is now mixed by mixing unheated tapioca into syrup
            ;assume certain flavour of unheated tapioca turns to exactly the same flavour of syrup by mixing
            (forall(?i - tapioca ?j - syrup)
                (when(and(ingredient-in-cup ?i ?c)(not(heated ?i ?c)))(and(not(ingredient-in-cup ?i ?c))(ingredient-in-cup ?j ?c)))
            )
                ) 
    )
    
    (:action tip-ingredients
        :parameters (?from - cup ?to - cup)
        :precondition (and 
            (cup-exist ?from)
            (cup-exist ?to)
            ;situations of 2 cups need to be different, otherwise no point for tipping
            (not(= ?from ?to))
                      )
        :effect (and
            ;transfer ingredients from one cup to another, the logic is same for all 4 ingredients
            ;transfer tapioca
            (forall(?i - tapioca)
                (when(ingredient-in-cup ?i ?from)(and(ingredient-in-cup ?i ?to)(not(ingredient-in-cup ?i ?from))))
            )
            ;transfer syrup
            (forall(?i - syrup)
                (when(ingredient-in-cup ?i ?from)(and(ingredient-in-cup ?i ?to)(not(ingredient-in-cup ?i ?from))))
            )
            ;transfer ice
            (when(ingredient-in-cup ice ?from)(and(ingredient-in-cup ice ?to)(not(ingredient-in-cup ice ?from))))
            ;transfer tea
            (when(ingredient-in-cup tea ?from)(and(ingredient-in-cup tea ?to)(not(ingredient-in-cup tea ?from))))
                ) 
    )
)
