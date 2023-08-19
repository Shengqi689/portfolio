(define (problem task2b)
  (:domain MakeHeatedMixedTea)
  (:objects
    tea - teas
    ice - ices
    mango-syrup - syrup
    lime-syrup - syrup
    lime-tapioca - tapioca
    mango-tapioca - tapioca
  )
  (:init
    (cup-exist)
  )
  (:goal (and
    (mixed)
    (ingredient-in-cup mango-syrup)
    (ingredient-in-cup lime-syrup)
    (ingredient-in-cup ice)
    (not(heated mango-syrup))
    (not(heated lime-syrup))
         )
  )
)