//
//  PokemonOfTheDayViewModel.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 26/12/24.
//

import Foundation
import SwiftData

@Observable
class PokemonOfTheDayViewModel {
    private var userCase: PokemonOfTheDayUserCase
    var pokemon: Pokemon? = nil

    init(_ pokemonOfTheDayUserCase: PokemonOfTheDayUserCase) {
        self.userCase = pokemonOfTheDayUserCase
        fetchAndUpdatePokemon()
    }


    func fetchAndUpdatePokemon() {
        Task {
            let pokemon = await userCase.execute()
            await updatePokemon(with: pokemon?.toModel())
        }
    }

    @MainActor
    func updatePokemon(with newPokemon: Pokemon?) {
        self.pokemon = newPokemon
    }
}
