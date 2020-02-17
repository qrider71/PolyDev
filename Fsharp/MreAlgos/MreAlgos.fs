open System
open Primes
open Util
open Frac
open Vector

[<EntryPoint>]
let main argv =
    let mDefault = 100 * 1000 * 1000
    let m = 
        match argv with 
        | [||] -> mDefault
        | [|x|] -> x |> int
        | _ -> mDefault

    let (primesNR, millisNR) = measurePerformance findPrimesNonRec m
    let primesCountNR = primesNR |> Seq.length

    printfn "F#: Found %i primes below %i in %i ms" primesCountNR m millisNR

    let (primes, millis) = measurePerformance findPrimes m
    let primesCount = primes |> Seq.length

    printfn "F# (recursive): Found %i primes below %i in %i ms" primesCount m millis

    0 // return an integer exit code
