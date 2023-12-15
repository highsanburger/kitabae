import Prelude hiding (Applicative, Functor, Monad, fmap, pure, return, (<$), (<*>), (>>=))

class Functor f where
  fmap :: (a -> b) -> (f a -> f b)

-- 1. Define an instance of the Functor class for the following type of binary trees that have data in their nodes:

data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Show)

instance Functor Tree where
  -- fmap :: (a -> b) -> Tree a -> Tree b
  fmap f Leaf = Leaf
  fmap f (Node left x right) = Node (fmap f left) (f x) (fmap f right)

nice = Node (Node Leaf 3 Leaf) 4 Leaf

-- 2. Complete the following instance declaration to make the partially-applied function type (a ->) into a functor:

instance Functor ((->) a) where
  -- fmap :: (b -> c) -> ((a -> b) -> (a -> c))
  fmap = (.)

-- READER!!!

class (Functor f) => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> (f a -> f b)

-- 3. Define an instance of the Applicative class for the type (a ->). If you are familiar with combinatory logic, you might recognise pure and <*> for this
--   type as being the well-known K and S combinators.

instance Applicative ((->) a) where
  -- pure :: b -> (a -> b)
  pure = const

  -- (<*>) :: (a -> (b -> c)) -> ((a -> b)  -> (a -> c))
  f <*> g = \x -> f x (g x)

-- 4. There may be more than one way to make a parameterised type into an applicative functor. For example, the library Control.Applicative provides
--    an alternative ‘zippy’ instance for lists, in which the function pure makes an infinite list of copies of its argument, and the operator <*>
--    applies each argument function to the corresponding argument value at the same position. Complete the following declarations that implement this idea:

newtype ZipList a = Z [a] deriving (Show, Semigroup)

instance Functor ZipList where
  -- fmap :: (a -> b) -> ZipList a -> ZipList b
  fmap g (Z xs) = Z $ g <$> xs

instance Applicative ZipList where
  -- pure :: a -> ZipList a
  pure x = Z $ repeat x

  -- <*> :: ZipList (a -> b) -> ZipList a -> ZipList b
  Z (g : gs) <*> Z (x : xs) = Z [g x] <> (Z gs <*> Z xs)

-- The ZipList wrapper around the list type is required because each type can only have at most one instance declaration for a given class.

-- 5. Work out the types for the variables in the four applicative laws.

{-
LAWS :-

I   : pure id <*> v = v                             Identity

  LHS :         (<*>)              (pure)     (id)        (v)
      (f (a -> b) -> (f a -> f b)) [(a -> f a) (a -> a)] [(f a)]
  ~~> (f a -> f a) (f a)
  ~~> (f a)
  ~~~> RHS : v

  RHS :
II  : pure f <*> pure x = pure (f x)                Homomorphism
III : u <*> pure y = pure (\f -> f y) <*> u         Interchange
IV  : u <*> (v <*> w) = pure (.) <*> u <*> v <*> w  Composition
-}

class (Applicative m) => Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

-- 6. Define an instance of the Monad class for the type (a ->).

instance Monad ((->) a) where
  return = const

  -- (>>=) :: a -> b -> b -> a -> c -> a -> b
  -- (>>=) :: (a -> b) -> (b -> (a -> c)) -> (a -> b)
  f >>= g = \x -> g (f x) x

-- 7. Given the following type of expressions

data Expr a = Var a | Val Int | Add (Expr a) (Expr a) deriving (Show)

-- that contain variables of some type a, show how to make this type into instances of the Functor, Applicative and Monad classes. With the aid of an
-- example, explain what the >>= operator for this type does.

instance Functor Expr where
  -- fmap :: (a -> b) -> (Expr a -> Expr b)
  fmap f (Var a) = Var $ f a
  fmap _ (Val n) = Val n
  fmap f (Add e1 e2) = Add (fmap f e1) (fmap f e2)

instance Applicative Expr where
  pure = Var

  -- (<*>) :: Expr (a -> b) -> (Expr a -> Expr b)
  (Var f) <*> expr = fmap f expr
  Val n <*> _ = Val n
  Add expr1 expr2 <*> expr = Add (expr1 <*> expr) (expr2 <*> expr)
