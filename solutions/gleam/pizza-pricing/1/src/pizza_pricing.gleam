// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(pizza) -> pizza_price(pizza) + 1
    ExtraToppings(pizza) -> pizza_price(pizza) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  order_price_item(order, 0)
}

fn order_price_item(order: List(Pizza), pizza_count: Int) -> Int {
  case order {
    [] if pizza_count == 1 -> 3
    [] if pizza_count == 2 -> 2
    [pizza, ..rest] ->
      pizza_price(pizza) + order_price_item(rest, pizza_count + 1)
    _ -> 0
  }
}
