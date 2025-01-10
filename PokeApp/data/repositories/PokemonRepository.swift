//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//

protocol PokemonRepository {
    func getPokemon(with id: Int) async throws -> PokemonDTO
}

