// Learn more about F# at http://fsharp.org

open System

let findPrimes m = sieve 3 (array (3,m) [(i,odd i) | i<-[3..m]] )
  where
    sieve :: Int -> UArray Int Bool -> [Int]
    sieve p a
      | p*p > m   = 2 : [i | (i,True) <- assocs a]
      | a!p       = sieve (p+2) $ a//[(i,False) | i <- [p*p, p*p+2*p..m]]
      | otherwise = sieve (p+2) a

let findPrimes m =
    let rec sieve p a = match (p,a)
        | (p,a) when p * p > m -> seq { for i in 1 .. n -> if a.[i] then i }
        | (p,a) when a.[p]  -> sieve (p+2) $ a
        | _ -> sieve (p+2) a
    sieve 3

[<EntryPoint>]
let main argv =
    printfn "Hello World from F#!"
    0 // return an integer exit code
