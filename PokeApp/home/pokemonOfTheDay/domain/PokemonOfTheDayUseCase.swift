//
//  PokemonOfTheDayUserCase.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//

protocol PokemonOfTheDayUseCase {
    mutating func execute() async -> PokemonOfTheDayEntity?
}
