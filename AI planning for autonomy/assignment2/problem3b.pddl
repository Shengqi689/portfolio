(define (problem task3b)
  (:domain MakeTwoCupTea)
  (:objects
    tea - teas
    ice - ices
    mango-syrup - syrup
    lime-syrup - syrup
    lime-tapioca - tapioca
    mango-tapioca - tapioca
    cup1 - cup
    cup2 - cup    
  )
  (:init
    (cup-exist cup1)
    (cup-exist cup2) 
  )
  (:goal (and
    (mixed cup2)
    (ingredient-in-cup mango-syrup cup2)
    (ingredient-in-cup lime-syrup cup2)
    (ingredient-in-cup ice cup2)
    (not(heated mango-syrup cup2))
    (heated lime-syrup cup2)
    (not(heated-cup cup1))
         )
  )
)