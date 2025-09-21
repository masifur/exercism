import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.pop_grapheme
  |> fn(grapheme) {
    case grapheme {
      Ok(#(first_letter, _)) -> first_letter
      _ -> ""
    }
  }
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.trim
  |> string.split(" ")
  |> list.fold("", fn(acc: String, word: String) -> String {
    acc
    |> string.append(word |> initial)
    |> string.append(" ")
  })
  |> string.trim_end
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     X. X.  +  X. X.     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  |> string.replace(
    "X. X.  +  X. X.",
    initials(full_name1) <> "  +  " <> initials(full_name2),
  )
}
