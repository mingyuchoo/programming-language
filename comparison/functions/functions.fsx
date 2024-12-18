// ///////////////////////////////////////////////////////////////////////////
// dotnet fsi functions.fsx
// ///////////////////////////////////////////////////////////////////////////

// Explicit function definition
let f1 x =
    match x with
    | Some x -> x
    | None -> 0

// Lambda expression
let f2 =
    fun x ->
        match x with
        | Some x -> x
        | None -> 0

// Point-free style using function keyword
let f3 =
    function
    | Some x -> x
    | None -> 0

// Main fucthion
let main argv =
    Some 10
    |> f1
    |> string
    |> printfn "%s"

    Some 10
    |> f2
    |> string
    |> printfn "%s"

    Some 10
    |> f3
    |> string
    |> printfn "%s"

    0 // return an integer exit code


// Apply
[<EntryPoint>]
main [||]
