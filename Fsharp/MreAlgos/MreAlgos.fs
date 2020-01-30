// Learn more about F# at http://fsharp.org

open System

let findPrimes m =

    let filterSieve p a =
        for i in seq { p*p .. 2*p .. m }
            a.[i] = false
        a

    let rec sieve p a = match (p,a)
        | (p,a) when p * p > m -> seq { for i in 2 .. n -> if a.[i] then i }
        | (p,a) when a.[p]  -> sieve (p+2) (a |> filterSieve (p a))
        | _ -> sieve (p+2) a
    sieve 3

[<EntryPoint>]
let main argv =
    printfn "Hello World from F#!"
    0 // return an integer exit code
