(* file: 091917.ml
  author: Bob Muller

  A simple example application tracking soccer goals.
  Find the name of the player with the highest average goals.

*)
type player        = {name : string; goals : int list}
type playerAverage = {name : string; average : float}

(* Sample data
*)
let players = [ {name = "Messier"; goals = [0; 1; 0; 1; 2; 2; 0]}
              ; {name = "Neymar";  goals = [1; 1; 1; 0; 2; 1; 3; 0]}
              (* ... *)
                  ; {name = "Muller";  goals = [1; 0; 2]}
              ]

(* findWinner : playerAverage -> playerAverage list -> string
*)
let rec findWinner best others =
  match others with
  | [] -> best.name
  | player :: others ->
    (match best.average >= player.average with
     | true  -> findWinner best others
     | false -> findWinner player others)

(* sum : int list -> float
*)
let rec sum goals =
  match goals with
  | [] -> 0.0
  | goal :: goals -> (float goal) +. sum goals

(* average : player -> playerAverage
*)
let average player =
  let ave = (sum player.goals) /. (float (List.length player.goals))
  in
  {name = player.name; average = ave}

(* averages : player list -> playerAverage list
*)
let rec averages players =
  match players with
  | [] -> []
  | player :: players -> (average player) :: averages players

(* winner : player list -> string
*)
let winner players =
  let averages = averages players
  in
  findWinner (List.hd averages) (List.tl averages)
