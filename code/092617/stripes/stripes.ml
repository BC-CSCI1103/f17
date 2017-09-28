(* file: stripes.ml
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

let verticalStripe width =
  Image.rectangle width displayHeight (Cs1103.randomColor())

let draw () =
  let ns = [3; 5; 32] in
  let n = List.nth ns (Random.int (List.length ns)) in
  let width = displayWidth /. (float n) in
  let rec repeat image m =
    match m = 0 with
    | true  -> image
    | false ->
      let x = (float (m - 1)) *. width in
      let stripe = verticalStripe width in
      let newImage = Image.place_image stripe (x, 0.) image
      in
      repeat newImage (m - 1)
  in
  repeat empty n

let go () =
  World.big_bang ()
    ~name:"Stripes"
    ~width:(f2I displayWidth)
    ~height:(f2I displayHeight)
    ~to_draw: draw
    ~rate: 1.0

let s = go ()
