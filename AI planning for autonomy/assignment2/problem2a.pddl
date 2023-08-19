(define (problem task2a)
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
    (not(heated tea))
    (heated mango-tapioca)
    (ingredient-in-cup mango-syrup)
    (not(heated mango-syrup))
    (not(ingredient-in-cup ice))
         )
  )
)