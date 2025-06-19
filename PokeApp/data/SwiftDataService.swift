//
//  SwiftDataService.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 9/1/25.
//
import SwiftData

//añadir un protocolo aqui
class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = SwiftDataService()

    @MainActor
    private init() {
        // Change isStoredInMemoryOnly to false if you would like to see the data persistance after kill/exit the app
        self.modelContainer = try! ModelContainer(for: PokemonOfTheDayEntity.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }

    func fetchPokemon() -> [PokemonOfTheDayEntity] {
        do {
            return try modelContext.fetch(FetchDescriptor<PokemonOfTheDayEntity>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func addPokemon(_ pokemon: PokemonOfTheDayEntity) {
        modelContext.insert(pokemon)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removePokemonOfTheDay() {
        do {
            try modelContext.delete(model: PokemonOfTheDayEntity.self) //Se elimina todo lo que hay guardado de esa entidad
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    

}
