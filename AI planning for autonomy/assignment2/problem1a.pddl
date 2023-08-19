(define (problem task1a)
  (:domain MakeTea)
  (:objects
    tea - teas
    ice - ices
    mango-tapioca - tapioca
    mango-syrup - syrup
  )
  (:init
    (cup-exist)
  )
  (:goal (and
    (iced)
    (ingredient-in-cup tea)
    (ingredient-in-cup mango-tapioca)
    (ingredient-in-cup mango-syrup)
         )
  )
)