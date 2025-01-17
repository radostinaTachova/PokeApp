//
//  Pokemon.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//

struct Pokemon {
    let name: String
    let height: Int
    let imageUrl: String
}

extension PokemonOfTheDayEntity {
    func toModel() -> Pokemon {
        Pokemon(name: self.name,
                height: self.height,
                imageUrl: self.imageUrl)
    }
}
