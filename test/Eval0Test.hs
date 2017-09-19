{-# LANGUAGE ScopedTypeVariables #-}
module Eval0Test where

import Test.Tasty.HUnit      (( @?=), Assertion)
import Test.Tasty.Hspec      (Spec, describe, it, shouldBe)
-- import Test.Tasty            (TestTree)
-- import Test.Tasty.QuickCheck (testProperty)

import Transformers (eval0, Value(IntVal))
import SampleExpressions (exp1)
import qualified Data.Map as Map

unit_interpret_exp1_using_eval0 :: Assertion
unit_interpret_exp1_using_eval0 =
  eval0 Map.empty exp1 @?= IntVal 18

spec_eval0_of_expression :: Spec
spec_eval0_of_expression = do
  describe "eval0(exp1)" $ do
    it "should evaluate to IntVal 18" $ do
      eval0 Map.empty exp1 `shouldBe` IntVal 18
