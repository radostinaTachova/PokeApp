//
//  PokemonOfTheDayView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 20/12/24.
//

import SwiftUI
import SwiftData

struct PokemonOfTheDayView: View {

    @State private var pokemonOfTheDayViewModel: PokemonOfTheDayViewModel?

    @MainActor
    private func initializeViewModel() {
        pokemonOfTheDayViewModel = PokemonOfTheDayViewModel(
            PokemonOfTheDayUseCaseImpl(
                pokemonRepository: PokemonRepositoryImpl(),
                dataService: SwiftDataService.shared // Asegurado en MainActor
            )
        )
    }

    var body: some View {
        VStack {
            HeaderView(title: "Pokemon of the Day")
            HStack(alignment: .top ,spacing: 0) {
                imageView
                nameTitle

            }
            .frame(maxWidth: .infinity, alignment: .topLeading)

        }
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .task {
            initializeViewModel()
        }

    }
    
    var nameTitle: some View {
        Text(" \(pokemonOfTheDayViewModel?.pokemon?.name ?? "none")")
            .textCase(.uppercase)
            .bold()
            .foregroundStyle(Color(.primary))
            .padding(20)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .foregroundStyle(Color.white)
                    .shadow(radius: 5)
                }
            .padding([.top, .trailing], 35)
    }
    
    var imageView: some View {
        AsyncImage(url: URL(string: pokemonOfTheDayViewModel?.pokemon?.imageUrl ?? ""), content: { image in
            image
                .padding(15)
                .background(content: {
                    Circle()
                        .fill(Color(.primary).opacity(0.4))
                        .shadow(radius: 5)

                })
        }, placeholder: {
            Text("None")
        })
        .padding(25)
    }



}

#Preview {
    PokemonOfTheDayView()
}
