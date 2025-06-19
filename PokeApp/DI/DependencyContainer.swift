//
//  DependencyContainer.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 19/6/25.
//

import Factory

extension Container {
    var pokemonRepository: Factory<PokemonRepository> {
        Factory(self) { PokemonRepositoryImpl() }
    }
    
    var typesUserCase: Factory<TypesUseCase> {
        Factory(self) { TypesUseCaseImpl(pokemonRepository: self.pokemonRepository()) }
    }
    
    var pokeTypesViewModel: Factory<PokeTypesViewModel> {
        Factory(self) { PokeTypesViewModel(self.typesUserCase()) }
    }
}


//TODO: Define your dependencies’ scopes (optional).
//  Scopes are used to define the lifetime of resolved dependencies. Factory provides several scope types, including Singleton, Cached, Graph, Shared, and Unique.
