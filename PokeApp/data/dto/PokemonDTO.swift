//
//  PokemonDTO.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 26/12/24.
//

struct PokemonDTO: Codable {
    let name: String
    let height: Int
    let sprites: PokemonSpritesDTO
}

struct PokemonSpritesDTO: Codable {
    let frontDefault: String
}



