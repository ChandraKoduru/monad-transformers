{-# OPTIONS_GHC -Wno-missing-import-lists #-}
module SampleExpressions where

import Language (Exp(..))

--exp1 --> 12 + ((\x -> x)(4+2))
exp1 :: Exp
exp1 = Lit 12 `Plus` App (Abs "x" (Var "x")) (Lit 4 `Plus` Lit 2)
