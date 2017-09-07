(* file: 090717.ml
  author: Bob Muller

  This is sample code from Meeting 2 of Week 2
  of CSCI 1103, Fall 2017. This meeting was 50
  minutes in length.

  This code illustrates
    1. function defintions with both implicit and
       explicit typing,
    2. tuples, in particular, pairs,
    3. let-in.
*)

(* double : int -> int
 *)
let double n = n * 2

(* An explicitly typed version. With this version,
  the OCaml compiler will check to confirm that the
  type annotation claims are correct.
*)
let double (n : int) : int = n * 2

(* isFactor : int -> int -> bool
 *)
let isFactor m n = n mod m = 0

(* A note on evaluation as simplification:

   isFactor (1 + 1) 6 --> isFactor 2 6
                      --> 6 mod 2 = 0
                      --> 0 = 0
                      --> true
  Yes, 2 is a factor of 6.
*)

(* div : int -> int -> (int * int)
 *
 * Three versions of the div function which returns
 * both the integer quotient and the remainder when
 * m is divided by n.
 *
 * The first is the simplest -- a one-liner.
 *)
let div m n = (m / n, m mod n)

(* This version uses let-in to name the intermediate
 * results.
 *)
let div m n =
  let quotient = m / n in
  let remainder = m mod n
  in
  (quotient, remainder)

(* This version is a funky one that no one would write.
 * It's included as another illustration of let-in.
 *)
let div m n =
  (let quotient = m / n in quotient,
   let remainder = m mod n in remainder)
