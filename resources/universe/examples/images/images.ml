(* author: Bob Muller
   date: September 18, 2017

  In order to run this code, type the following commands in the unix shell:

  > make
  > ./images
*)

open Color
open Image
open World
open Cs1103

(* 

   The following definition of yellowCircle displays a green
   circle. Modify the code so that the circle that it displays
   is yellow.
*)
let displayWidth = 600.
let displayHeight = displayWidth
let radius = displayWidth /. 2.0
let pi = acos(-1.0)

let image0 = Image.circle radius Color.dodgerBlue

let image1 = Image.place_image (Image.rectangle radius radius Color.limeGreen) (radius, radius) image0
                               
let image2 =
  let line = Image.line [(radius, 0.)] ~size:20. Color.limeGreen
  in
  Image.place_image line (radius, radius) image0

let image3 =
  let line = Image.line [(radius, 0.); (0., -. radius)] ~size:20. Color.limeGreen
  in
  Image.place_image line (radius, radius) image0

let image4 =
  let line = Image.line [(radius, 0.); (0., -. radius)] ~size:20. Color.limeGreen
  in
  Image.place_image line (0., 0.) image0

let image5 =
  let (r, g, b) = Color.to_rgb Color.limeGreen in
  let newColor = Color.make_color ~alpha:200 r g b
  in
  Image.place_image (Image.rectangle radius radius newColor) (radius, radius) image0
  

let draw image () =
  let empty = Image.empty_scene displayWidth displayHeight
  in
  Image.place_image image (0.0, 0.0) empty

let imageTest () =
  let drawImage image name =
    World.big_bang  ()
                    ~name: name
                    ~width: (f2I displayWidth)
                    ~height: (f2I displayHeight)
                    ~to_draw: (draw image)
  in
  drawImage image0 "Circle";
  drawImage image1 "Circle with Square with side=radius at (radius, radius)";
  drawImage image2 "Circle with Line=[(radius, 0.)] at (radius, radius)";
  drawImage image3 "Circle with Line=[(radius, 0.); (0., -. radius)] at (radius, radius)";
  drawImage image4 "Circle with Line=[(radius, 0.); (0., -. radius)] at (0., 0.)";
  drawImage image5 "Circle with Square with side=radius & alpha=200 at (radius, radius)"

       
let _ = imageTest ()
