{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module Transformers where

-- import Control.Monad.Identity
-- import Control.Monad.Error
-- import Control.Monad.Reader
-- import Control.Monad.State
-- import Control.Monad.Writer
import Data.Maybe (fromJust)
import qualified Data.Map as Map

type Name = String

data Exp = Lit Integer
         | Var Name
         | Plus Exp Exp
         | Abs Name Exp
         | App Exp Exp
         deriving (Show, Eq)

data Value = IntVal Integer 
           | FunVal Env Name Exp
           deriving (Show, Eq)

type Env = Map.Map Name Value

-- | Basic interpreter implementation
--
-- >>> eval0 Map.empty (Plus (Lit 8) (Lit 10))
-- IntVal 18
--
eval0 :: Env -> Exp -> Value
eval0 env (Lit i) = IntVal i
eval0 env (Var n) = fromJust (Map.lookup n env)
eval0 env (Plus e1 e2) = IntVal (i1 + i2)
  where
    IntVal i1 = eval0 env e1
    IntVal i2 = eval0 env e2
eval0 env (Abs name e) = FunVal env name e
eval0 env (App e1 e2) = let val1 = eval0 env e1
                            val2 = eval0 env e2
                        in
                          case val1 of
                            FunVal env' name' body -> eval0 (Map.insert name' val2 env') body


