module Main where

import Args (getArgs)

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ show args
