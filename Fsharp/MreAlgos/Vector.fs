module Vector

type Vector<'T>(elements: array<'T>, add':'T -> 'T -> 'T, sub':'T -> 'T -> 'T, mul':'T -> 'T -> 'T, div':'T -> 'T -> 'T) =
    member this.v = elements

    static member (+) (v1: Vector<'T>, v2: Vector<'T>) = v1.add(v2)
    member this.add (v:Vector<'T>) = Vector(this._add (this.v, v.v), add',sub', mul', div')
    member private this._add (v1, v2) = Array.map2 add' v1 v2

    static member (-) (v1: Vector<'T>, v2: Vector<'T>) = v1.sub(v2)
    member this.sub (v:Vector<'T>) = Vector(this._sub (this.v, v.v), add',sub', mul', div')
    member private this._sub (v1, v2) = Array.map2 sub' v1 v2

    static member (*) (v1: Vector<'T>, v2: Vector<'T>) = v1.mul(v2)
    member this.mul (v:Vector<'T>) = this._mul (this.v, v.v) |> Array.reduce(add')
    member private this._mul (v1, v2) = Array.map2 mul' v1 v2

    static member (*) (c: 'T, v: Vector<'T>) = v.mul(c)
    member this.mul (c:'T) = Vector(this._cmul (this.v, c), add',sub', mul',div')
    member private this._cmul (v1, c) = Array.map (mul' c) v1 

    static member (/) (v: Vector<'T>, c: 'T) = v.div(c)
    member this.div (c:'T) = Vector(this._cdiv (this.v, c), add',sub', mul', div')
    member private this._cdiv (v1, c) = Array.map (div' c) v1 

let inline vec elements = 
  Vector(elements, (+),(-),(*),(/))