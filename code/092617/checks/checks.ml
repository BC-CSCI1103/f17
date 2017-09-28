(* file: checks.ml
   author: Bob Muller

   CSCI 1103 Computer Science I Honors

   A simple program demo-ing Asai's Universe library.
*)
open World
open Image
open Color
open Cs1103

let displayWidth = 800.
let displayHeight = displayWidth
let empty = Image.rectangle displayWidth displayHeight white

let column m =
  let side = displayWidth /. (float m) in
  let empty = Image.rectangle side displayHeight Color.white in
  let rec repeat image m =
    match m = 0 with
    | true  -> image
    | false ->
      let check = Image.rectangle side side (randomColor()) in
      let y = (float (m - 1)) *. side in
      let newImage = Image.place_image check (0., y) image
      in
      repeat newImage (m - 1)
  in
  repeat empty m


let draw () =
  let ns = [3; 5; 32] in
  let n = List.nth ns (Random.int (List.length ns)) in
  let width = displayWidth /. (float n) in
  let rec repeat image m =
    match m = 0 with
    | true  -> image
    | false ->
      let x = (float (m - 1)) *. width in
      let column = column n in
      let newImage = Image.place_image column (x, 0.) image
      in
      repeat newImage (m - 1)
  in
  repeat empty n

let go () =
  World.big_bang ()
    ~name:"Checks"
    ~width:(f2I displayWidth)
    ~height:(f2I displayHeight)
    ~to_draw: draw
    ~rate: 1.0

let s = go ()
