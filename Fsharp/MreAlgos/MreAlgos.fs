// Learn more about F# at http://fsharp.org

open System

let findPrimes m =
    let rec sieve p a = match (p,a)
        | (p,a) when p * p > m -> seq { for i in 2 .. n -> if a.[i] then i }
        | (p,a) when a.[p]  -> sieve (p+2) (a |> filterSieve (p))
        | _ -> sieve (p+2) a
    sieve 3

[<EntryPoint>]
let main argv =
    printfn "Hello World from F#!"
    0 // return an integer exit code
