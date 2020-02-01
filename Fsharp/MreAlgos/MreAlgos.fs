// Learn more about F# at http://fsharp.org

open System

let findPrimes m =

    let filterSieve (p:int, a:bool[]) =
        for i in seq { p*p .. 2*p .. (m-1) } do a.[i] <- false
        a

    let rec sieve (p:int, a:bool[]) = 
        match (p,a) with
        | (p,a) when p * p > m -> seq { for i in 2 .. (m-1) do if a.[i] then yield i}
        | (p,a) when a.[p]  -> sieve ( (p+2), filterSieve (p, a) ) 
        | _ -> sieve ((p+2), a)
   
    let a = Array.create m true
    for i in 4 .. 2 .. (m-1) do a.[i] <- false
    sieve (3, a)

[<EntryPoint>]
let main argv =
    let timer = System.Diagnostics.Stopwatch()
    let mDefault = 100 * 1000 * 1000
    let m = 
        match argv with 
        | [||] -> mDefault
        | [|x|] -> x |> int
        | _ -> mDefault

    timer.Start()
    let primes = findPrimes(m)

    let millis = timer.ElapsedMilliseconds

    let primesCount = primes |> Seq.length
    printfn "F#: Found %i primes below %i in %i [ms]" primesCount m millis
    0 // return an integer exit code
