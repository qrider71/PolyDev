module Lib
    ( someFunc
    ) where

import Data.Array.Unboxed
import System.CPUTime
import Text.Printf


primesToA :: Int -> [Int]
primesToA m = sieve 3 (array (3,m) [(i,odd i) | i<-[3..m]] :: UArray Int Bool)
  where
    sieve :: Int -> UArray Int Bool -> [Int]
    sieve p a
      | p*p > m   = 2 : [i | (i,True) <- assocs a]
      | a!p       = sieve (p+2) $ a//[(i,False) | i <- [p*p, p*p+2*p..m]]
      | otherwise = sieve (p+2) a

someFunc :: IO ()
someFunc = do
  start <- getCPUTime
  putStrLn $ show $ length $ primesToA 100000000
  end   <- getCPUTime
  let diff = (fromIntegral (end - start)) / (10^9)
  printf "Computation time: %0.3f ms\n" (diff :: Double)

