(define (problem task3a)
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
    (not(heated tea cup2))
    (heated mango-tapioca cup2)
    (ingredient-in-cup mango-syrup cup2)
    (not(heated mango-syrup cup2))
    (not(ingredient-in-cup ice cup2))
    (not(heated-cup cup1))
         )
  )
)