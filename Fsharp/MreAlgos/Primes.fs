module Primes

let findPrimesNonRec m =
    let maxIndex = m-1
    let maxIndexSqrt = int(sqrt (float maxIndex))
    let a = Array.create m true
    for i in 3 .. 2 .. maxIndexSqrt do 
        if (a.[i]) then
            for j in i*i .. 2*i .. maxIndex do a.[j] <- false
    Seq.append (Seq.singleton 2) (seq { for i in 3 .. 2 .. maxIndex do if a.[i] then yield i})
        
let findPrimes m =
    let maxIndex = m-1
    let filterSieve (p:int, a:bool[]) =
        for i in p*p .. 2*p .. maxIndex do a.[i] <- false
        a

    let rec sieve (p:int, a:bool[]) = 
        match (p,a) with
        | (p,a) when p * p > maxIndex -> seq { for i in 2 .. maxIndex do if a.[i] then yield i}
        | (p,a) when a.[p]  -> sieve (p+2, filterSieve (p, a) ) 
        | _ -> sieve (p+2, a)
   
    let a = Array.create m true
    for i in 4 .. 2 .. maxIndex do a.[i] <- false
    sieve (3, a)
