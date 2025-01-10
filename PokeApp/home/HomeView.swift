//
//  HomeView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import SwiftUI

struct HomeView: View {

    @Environment(NavigationCoordinator.self) private var coordinator

    var body: some View {
        Text("HOME!")
        Button("Go The poke HISTORY") {
            coordinator.navigate(to: .home(.history))
        }
        Button("POKEMON"){
            coordinator.navigate(to: .home(.pokemonOfTheDay))
        }
        Button("GAME") {
            coordinator.navigate(to: .game)
        }
    }
}

#Preview("HomeView") {
    VStack {
        @State var coordinator = NavigationCoordinator()
        HomeView()
            .environment(coordinator)
    }
}
