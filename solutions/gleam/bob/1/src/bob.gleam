import gleam/list
import gleam/string

pub fn hey(remark: String) -> String {
  let does_end_with_question =
    string.trim(remark)
    |> string.ends_with("?")

  let is_all_capital =
    string.to_utf_codepoints(remark)
    |> list.fold_until(False, fn(acc, i) {
      case string.utf_codepoint_to_int(i) {
        code if code >= 65 && code <= 90 -> list.Continue(True)
        code if code >= 97 && code <= 122 -> list.Stop(False)
        _ -> list.Continue(acc)
      }
    })

  let is_empty =
    string.trim(remark)
    |> string.is_empty

  case is_empty, does_end_with_question, is_all_capital {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, _ -> "Sure."
    _, _, True -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}
