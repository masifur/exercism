import gleam/int

pub fn convert(number: Int) -> String {
  case number {
    number if number % 3 != 0 && number % 5 != 0 && number % 7 != 0 ->
      int.to_string(number)
    _ ->
      case number % 3 {
        0 -> "Pling"
        _ -> ""
      }
      <> case number % 5 {
        0 -> "Plang"
        _ -> ""
      }
      <> case number % 7 {
        0 -> "Plong"
        _ -> ""
      }
  }
}
