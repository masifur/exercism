import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  case result.all([rule1(game), rule3(game), rule4(game), Ok(rule2(game))]) {
    Error(message) -> Game(..game, error: message)
    Ok([_, _, _, Game(player: White, ..)]) -> rule2(Game(..game, player: Black))
    Ok([_, _, _, Game(player: Black, ..)]) -> rule2(Game(..game, player: White))
    _ -> game
  }
}
