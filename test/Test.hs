{-# LANGUAGE ScopedTypeVariables #-}
module Test where

import Data.List(sort)
import Test.Tasty(TestTree)
import Test.Tasty.HUnit ((@?=), Assertion, testCase)
import Test.Tasty.Hspec (Spec, describe, it, shouldBe)
import Test.Tasty.QuickCheck(testProperty)

-- HUnit test case
unit_two_plus_three_equalto_five :: Assertion
unit_two_plus_three_equalto_five =
  (2+3) @?= (5 :: Int)

-- Hspec specification
spec_two_minus_one_equal_to_one :: Spec
spec_two_minus_one_equal_to_one = do
  describe "Prelude.head" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

-- QuickCheck property
prop_additionCommutative :: Int -> Int -> Bool
prop_additionCommutative a b = a + b == b + a

-- Smallcheck property
scprop_sortReverse :: [Int] -> Bool
scprop_sortReverse list = sort list == sort (reverse list)

-- Tasty TestTree
test_multiplication :: [TestTree]
test_multiplication = [testProperty "One is identity" $ \(a :: Int) -> a * 1 == a]

-- Tasty IO TestTree
test_generateTree :: IO TestTree
test_generateTree = do
  input <- pure "Some input"
  pure $ testCase input $ pure ()

-- Tasty IO [TestTree]
test_generateTrees :: IO [TestTree]
test_generateTrees = do
  inputs <- pure ["First input", "Second input"]
  pure $ map (\s -> testCase s $ pure ()) inputs
