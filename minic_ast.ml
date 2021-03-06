(* Représentation des types. *)
type typ =
  | Int
  | Bool
  | Void
  | String

(* Représentation des expressions.
   Ajouté : les constantes booléennes. *)
type expr =
  | Null of string
  | Cst of int
  | BCst of bool
  | Str of string
  | Add of expr * expr
  | Mul of expr * expr
  | Lt  of expr * expr
  | Get of string
  | Call of string * expr list
  | Eg of expr * expr
  | And of expr * expr  
  | Or of expr * expr
  | Not of expr

(* Représentation des instructions et séquences. *)
type instr =
  | Putchar of expr
  | Set of string * expr
  | If  of expr * seq * seq
  | While of expr * seq
  | For of (string * typ * expr) * expr * seq
  | Return of expr
  | Expr of expr
  | Skip
and seq = instr list

(* Représentétion des fonctions. *)
type fun_def = {
  name: string;
  params: (string * typ) list;
  return: typ;
  locals: (string * typ * expr) list;
  code: seq;
}

(* Représentation des programmes.
   En réponse à l'indication de l'énoncé, j'associe une valeur entière
   à chaque variable globale. Mais vous voudrez peut-être faire évoluer
   cela (et procéder de même pour les variables locales des fonctions). *)
type prog = {
  globals: (string * typ * expr) list;
  functions: fun_def list;
  main: fun_def list;
}
