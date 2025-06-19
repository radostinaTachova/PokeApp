//
//  TypesUserCaseImpl.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 18/6/25.
//
import Foundation

struct TypesUseCaseImpl: TypesUseCase {

    private var pokemon: [PokemonOfTheDayEntity] = []
    private var pokemonRepository: PokemonRepository
//    private var dataService: SwiftDataService

    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }

    func execute() async -> [TypeEntity]? {
        let types = try? await pokemonRepository.getAllPokemonTypes()
        return types?.map({$0.toEntity})
    }
}
