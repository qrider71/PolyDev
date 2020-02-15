module Frac

open Util
open System

// Represents a fraction
type Frac(nominator: int, denominator: int) =
    let (n', d') = simplify nominator denominator
    member this.n = n'
    member this.d = d'

    static member (+) (f1: Frac, f2: Frac) =
        let n' = f1.n * f2.d + f2.n * f1.d
        let d' = f1.d * f2.d
        Frac(n', d')

    static member (-) (f1: Frac, f2: Frac) =
        let n' = f1.n * f2.d - f2.n * f1.d
        let d' = f1.d * f2.d
        Frac(n', d')

    static member (*) (f1: Frac, f2: Frac) =
        let n' = f1.n * f2.n
        let d' = f1.d * f2.d
        Frac(n', d')

    static member (/) (f1: Frac, f2: Frac) =
        let n' = f1.n * f2.d
        let d' = f1.d * f2.n
        Frac(n', d')

    override this.Equals(b) =
        match b with
        | :? Frac as f2 -> (this.n, this.d) = (f2.n, f2.d)
        | _ -> false

    override this.GetHashCode() = (this.n, this.d).GetHashCode()

    interface IEquatable<Frac> with
            member this.Equals(that : Frac) =
                this.Equals(that)   

    interface IComparable with
        member this.CompareTo(thatObj) =
            match thatObj with
            | :? Frac as that -> compare (this.n * that.d) (that.n*this.d)                   
            | _ -> raise <| ArgumentException("Can't compare instances of different types")

    override this.ToString() =
        if (this.d = 1)
        then this.n.ToString()
        else this.n.ToString() + "/" + this.d.ToString()
