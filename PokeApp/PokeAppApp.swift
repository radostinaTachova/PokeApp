//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import SwiftUI
import SwiftData

@main
struct PokeAppApp: App {
//    let container: ModelContainer

    var body: some Scene {
        WindowGroup {
            RootView()
        }
//        .modelContainer(container)
    }

//    init() {
//          do {
//              container = try ModelContainer(for: PokemonOfTheDayEntity.self)
//          } catch {
//              fatalError("Failed to create ModelContainer for PokemonOfTheDayEntity.")
//          }
//      }
}
