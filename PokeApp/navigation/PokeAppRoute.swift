//
//  PokeAppRoute.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 20/12/24.
//

import Foundation
import SwiftUI

enum Tab: Equatable {
    case home, pokeTypes, game
}

enum PokeAppRoute: Hashable {
    case home(HomeRoute)
    case pokeType
    case game

    @ViewBuilder
    var destination: some View {
        switch self {
        case .home(let route):
            route.destination
        case .game:
            GameView()
        case .pokeType:
            PokeTypesView(viewModel: PokeTypesViewModel(TypesUserCaseImpl(pokemonRepository: PokemonRepositoryImpl())))
        }
    }

    var tab: Tab {
        switch self {
        case .game:
            Tab.game
        case .home(_):
            Tab.home
        case .pokeType:
            Tab.pokeTypes
        }
    }
}


enum HomeRoute {
    case home
    case history
    case pokemonOfTheDay

    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeView()
        case .history:
            HistoryView()
        case .pokemonOfTheDay:
            PokemonOfTheDayView()
        }
    }
}
