module Lib
    ( runBenchmark
    ) where

import Data.Array.Unboxed
import Text.Printf
import System.TimeIt

findPrimes :: Int -> [Int]
findPrimes m = sieve 3 (array (3,m) [(i,odd i) | i<-[3..m]] :: UArray Int Bool)
  where
    sieve :: Int -> UArray Int Bool -> [Int]
    sieve p a
      | p*p > m   = 2 : [i | (i,True) <- assocs a]
      | a!p       = sieve (p+2) $ a//[(i,False) | i <- [p*p, p*p+2*p..m]]
      | otherwise = sieve (p+2) a

runBenchmark :: [String] -> IO ()
runBenchmark args = case args of
    [] -> performBenchmark default_count
    (head:_) -> performBenchmark $ read head
    where 
        default_count = 100*1000*1000
        performBenchmark n = timeIt $ printf "Found %d primes below %d - " (length (findPrimes n))  n