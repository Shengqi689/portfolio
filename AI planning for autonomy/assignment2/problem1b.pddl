(define (problem task1b)
  (:domain MakeTea)
  (:objects
    tea - teas
    ice - ices
    mango-syrup - syrup
    apple-syrup - syrup
  )
  (:init
    (cup-exist)
  )
  (:goal (and
    (iced)
    (ingredient-in-cup tea)
    (ingredient-in-cup apple-syrup)
    (ingredient-in-cup mango-syrup)
         )
  )
)