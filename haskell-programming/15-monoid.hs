{- Optional Monoid -}
-- Write the Monoid instance for our Maybe type renamed to Optional.
--
-- λ> Only (Sum 1) `mappend` Only (Sum 1) ~~~> Only (Sum {getSum = 2})
-- λ> Only (Product 4) `mappend` Only (Product 2) ~~~> Only (Product {getProduct = 8})
-- λ> Only (Sum 1) `mappend` Nada ~~~> Only (Sum {getSum = 1})
-- λ> Only [1] `mappend` Nada ~~~> Only [1]
-- λ> Nada `mappend` Only (Sum 1) ~~~> Only (Sum {getSum = 1})

-- import Data.Monoid
-- import Data.Semigroup

data Optional a = Nada | Only a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Optional a) where
  Nada <> x = x
  x <> Nada = x
  Only x <> Only y = Only $ x <> y

instance (Semigroup a, Monoid a) => Monoid (Optional a) where
  mempty = Nada
  mappend = (<>)

{- Maybe Another Monoid-}
-- Write a Monoid instance for a Maybe type which doesn’t require a Monoid for the contents. Reuse the Monoid law QuickCheck properties and use
-- them to validate the instance.
-- Don’t forget to write an Arbitrary instance for First'. We won’t always stub that out explicitly for you. We suggest learning how to
-- use the frequency function from QuickCheck for First'’s instance.
