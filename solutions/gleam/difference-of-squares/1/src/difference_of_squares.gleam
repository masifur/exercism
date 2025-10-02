import gleam/int

pub fn square_of_sum(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> { n * { n + 1 } / 2 } * { n * { n + 1 } / 2 }
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> { n * n } + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  int.absolute_value(sum_of_squares(n) - square_of_sum(n))
}
