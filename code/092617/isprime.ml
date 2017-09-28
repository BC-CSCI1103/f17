(* file: isprime.ml
   author: Bob Muller

   CSCI 1103 Computer Science I Honors

   A simple program computing a primality tester.
*)

(* isFactor : int -> int -> bool
*)
let isFactor m n = n mod m = 0

(* intSqrt : int -> int
*)
let intSqrt n = int_of_float (sqrt (float n))

(* isPrime : int -> bool
*)
let isPrime n =
  let top = intSqrt n in
  let rec repeat i =
    match i > top with
    | true  -> true
    | false ->
      (match isFactor i n with
       | true  -> false
       | false -> repeat (i + 1))
  in
  repeat 2
