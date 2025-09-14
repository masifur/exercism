import gleam/int
import gleam/list
import gleam/yielder

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  Character(
    charisma: 0,
    constitution: 0,
    dexterity: 0,
    hitpoints: 0,
    intelligence: 0,
    strength: 0,
    wisdom: 0,
  )
  |> assign_strength
  |> assign_dexterity
  |> assign_constitution
  |> assign_wisdom
  |> assign_intelligence
  |> assign_charisma
  |> assign_hitpoints
}

fn assign_strength(character: Character) -> Character {
  Character(..character, strength: ability())
}

fn assign_dexterity(character: Character) -> Character {
  Character(..character, dexterity: ability())
}

fn assign_constitution(character: Character) -> Character {
  Character(..character, constitution: ability())
}

fn assign_wisdom(character: Character) -> Character {
  Character(..character, wisdom: ability())
}

fn assign_intelligence(character: Character) -> Character {
  Character(..character, intelligence: ability())
}

fn assign_charisma(character: Character) -> Character {
  Character(..character, charisma: ability())
}

fn assign_hitpoints(character: Character) -> Character {
  Character(..character, hitpoints: 10 + modifier(character.constitution))
}

pub fn modifier(score: Int) -> Int {
  case score - 10 {
    score if score % 2 == 0 -> score / 2
    score if score < 0 -> score / 2 - 1
    score if score > 0 -> score / 2
    _ -> 0
  }
}

pub fn ability() -> Int {
  yielder.repeatedly(fn() -> Int { 1 + int.random(6) })
  |> yielder.take(4)
  |> yielder.to_list
  |> list.sort(by: int.compare)
  |> list.drop(1)
  |> int.sum
}
