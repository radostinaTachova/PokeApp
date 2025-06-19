//
//  ContentView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import SwiftUI
import SwiftData

struct RootView: View {
    @State private var coordinator = NavigationCoordinator()

    var body: some View {
        TabView(selection: $coordinator.selectedTab) {

            NavigationStack(path: $coordinator.homePath) {
                HomeView().navigationDestination(for: HomeRoute.self) { route in
                    route.destination
                }
            }.tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(Tab.home)

            PokeTypesView(viewModel: PokeTypesViewModel(TypesUserCaseImpl(pokemonRepository: PokemonRepositoryImpl()))).tabItem {
                Label("types", systemImage: "tray.2.fill")
            }
            .tag(Tab.pokeTypes)

            GameView().tabItem {
                Label("CardMatch", systemImage: "gamecontroller.fill")
            }
            .tag(Tab.game)
        }
        .environment(coordinator) 
        .onChange(of: coordinator.selectedTab, {
            coordinator.resetTab(coordinator.selectedTab)
        })
    }
}

#Preview {
    RootView()
}
