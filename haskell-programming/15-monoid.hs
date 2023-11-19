{- Optional Monoid -}
-- Write the Monoid instance for our Maybe type renamed to Optional.
--
-- λ> Only (Sum 1) `mappend` Only (Sum 1) ~~~> Only (Sum {getSum = 2})
-- λ> Only (Product 4) `mappend` Only (Product 2) ~~~> Only (Product {getProduct = 8})
-- λ> Only (Sum 1) `mappend` Nada ~~~> Only (Sum {getSum = 1})
-- λ> Only [1] `mappend` Nada ~~~> Only [1]
-- λ> Nada `mappend` Only (Sum 1) ~~~> Only (Sum {getSum = 1})

import Data.Monoid
import Data.Semigroup

data Optional a = Nada | Only a deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
  Nada <> x = x
  x <> Nada = x
  (Only x) <> (Only y) = Only (x <> y)

instance (Semigroup a, Monoid a) => Monoid (Optional a) where 
  mempty = Nada
  mappend = (<>)

