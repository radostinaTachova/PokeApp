//
//  PokemonOfTheDayUserCaseImpl.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 3/1/25.
//
import SwiftData
import SwiftUI

struct PokemonOfTheDayUseCaseImpl: PokemonOfTheDayUseCase {

    private var pokemon: [PokemonOfTheDayEntity] = []
    private var pokemonRepository: PokemonRepository
    private var dataService: SwiftDataService

    init(pokemonRepository: PokemonRepository, dataService: SwiftDataService) {
        self.pokemonRepository = pokemonRepository
        self.dataService = dataService
    }

    mutating func execute() async -> PokemonOfTheDayEntity? {
        updatePokemonData()

        if let pokemonOfTheDay = pokemon.first {
            return pokemonOfTheDay
        }
        let pokeId = Int.random(in: 1...500)
        do {
            let pokemonDTO = try await pokemonRepository.getPokemon(with: pokeId)
            let pokemonOfTheDay = pokemonDTO.toPersistantEntity()
            dataService.addPokemon(pokemonOfTheDay)
            return pokemonOfTheDay
        } catch {
            print("PokemonOfTheDayUserCaseImpl: ERROR!!!")
        }
        return nil
    }
}

extension PokemonOfTheDayUseCaseImpl {
    private mutating func updatePokemonData() {
        pokemon = dataService.fetchPokemon()
        guard let pokemonOfTheDay = pokemon.first, pokemonOfTheDay.isTodayPokemon else{
            print("There is not pokemon to update")
            return
        }
        dataService.removePokemonOfTheDay()
        pokemon = []
    }

}

extension PokemonOfTheDayEntity {
    var isTodayPokemon: Bool {
        self.date == Calendar.currentDateWithPokeFormat
    }
}

extension Calendar {
    static var currentDateWithPokeFormat: String? {
        let components = Calendar.current.dateComponents([.day, .month], from: .now)
        guard let currentDay = components.day, let currentMonth = components.month else {
            return nil
        }
        let date = String(currentDay) + String(currentMonth)
        print("CurrentDate = \(date)")
        return date
    }
}
