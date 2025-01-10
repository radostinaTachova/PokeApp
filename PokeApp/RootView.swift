//
//  ContentView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import SwiftUI
import SwiftData

struct RootView: View {
    @State private var coordinator = NavigationCoordinator() //StateObject si se usa observableObject

    //enum for Tabs, add other tabs if needed
    //Pensar como sería la mejor manera de relacionar RootView con la tabView, igual habría que sacar la tabview de aqui y separar los dos conceptos, ¿o serían el mismo concepto?


    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            //Sacar una funcion que cree estos navigationstack como views
            NavigationStack(path: $coordinator.homePath) {
                HomeView().navigationDestination(for: HomeRoute.self) { route in
                    route.destination
                }
            }.tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(Tab.home)

            PokeTypesView().tabItem {
                Label("types", systemImage: "tray.2.fill")
            }
            .tag(Tab.pokeTypes)

            GameView().tabItem {
                Label("CardMatch", systemImage: "gamecontroller.fill")
            }
            .tag(Tab.game)
        }
        .environment(coordinator) //Pasamos el coordinador global
        .onChange(of: coordinator.selectedTab, {
            coordinator.resetTab(coordinator.selectedTab)
        })
    }
}

#Preview {
    RootView()
}
