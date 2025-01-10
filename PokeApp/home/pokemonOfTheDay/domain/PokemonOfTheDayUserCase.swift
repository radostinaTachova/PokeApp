//
//  PokemonOfTheDayUserCase.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//

protocol PokemonOfTheDayUserCase {
    mutating func execute() async -> PokemonOfTheDayEntity?
}
