import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(collection |> set.contains(card), collection |> set.insert(card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  #(
    { collection |> set.contains(my_card) }
      && !{ collection |> set.contains(their_card) },
    collection |> set.delete(my_card) |> set.insert(their_card),
  )
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  do_boring_cards(collections, list.new())
}

fn do_boring_cards(
  collections: List(Set(String)),
  cards: List(String),
) -> List(String) {
  case collections, list.is_empty(cards) {
    [], _ -> cards
    [collection, ..rest], True ->
      do_boring_cards(rest, collection |> set.to_list)
    [collection, ..rest], False ->
      do_boring_cards(
        rest,
        cards |> set.from_list |> set.intersection(collection) |> set.to_list,
      )
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> do_unique_cards(set.new())
  |> set.size
}

fn do_unique_cards(
  collections: List(Set(String)),
  unique_collection: Set(String),
) -> Set(String) {
  case collections {
    [] -> unique_collection
    [collection, ..rest] ->
      do_unique_cards(rest, unique_collection |> set.union(collection))
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(collection) { collection |> string.starts_with("Shiny ") })
}
