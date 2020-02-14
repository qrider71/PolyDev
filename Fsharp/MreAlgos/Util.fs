module Util

open System

let measurePerformance (f, p) =
    let timer = System.Diagnostics.Stopwatch()
    timer.Start()
    let result = f (p)
    let millis = timer.ElapsedMilliseconds
    (result, millis)

// greatest common divisor
let rec gcd a b =
    if a = 0 then b
    elif a < b then gcd a (b - a)
    else gcd (a - b) b

let simplify a b =
    let (a', b', absA', absB') =
        match (a, b) with
        | (0,_) -> (0,1,0,1)
        | (a,b) when a<0 && b<0 -> (-a,-b,-a,-b)
        | (a,b) when a>0 && b<0 -> (-a,b, a,-b)
        | _ -> (a, b, abs a, abs b)

    let gcd' = gcd absA' absB'
    (a' / gcd', b' / gcd')
