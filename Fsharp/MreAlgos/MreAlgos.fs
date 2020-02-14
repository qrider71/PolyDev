open System
open Primes
open Util
open Frac
open Vector

[<EntryPoint>]
let main argv =
    let mDefault = 100
    let m = 
        match argv with 
        | [||] -> mDefault
        | [|x|] -> x |> int
        | _ -> mDefault

    let (primesNR, millisNR) = measurePerformance(findPrimesNonRec, m)
    let primesCountNR = primesNR |> Seq.length

    printfn "F#: Found %i primes below %i in %i ms" primesCountNR m millisNR

    let (primes, millis) = measurePerformance(findPrimes, m)
    let primesCount = primes |> Seq.length

    printfn "F# (recursive): Found %i primes below %i in %i ms" primesCount m millis

    let a = Frac(11,5)
    let b = Frac(1,5)
    let c = a-b
    printfn "%A" c

    let v1:Vector<int> = vec [|1;2;3;4|]
    let v2:Vector<int> = vec [|5;6;7;8|]
    let v3 = v1.add (v2)
    printfn "%A" v3.v.[0]
    0 // return an integer exit code
