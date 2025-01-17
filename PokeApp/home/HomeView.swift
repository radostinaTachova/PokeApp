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
        VStack(alignment: .center) {
            HeaderView(title: "Home")
            ScrollView {
                getHomeButtonView("Poke HISTORY 📖", navigateTo: .home(.history))
                getHomeButtonView("Pokemon of the DAY", navigateTo: .home(.pokemonOfTheDay))
                getHomeButtonView("Game 🎮", navigateTo: .game)
            }

        }.frame(maxHeight: .infinity, alignment: .topLeading)
    }

    func getHomeButtonView(_ title: String, navigateTo route: PokeAppRoute) -> some View {
        Button(action: {
            coordinator.navigate(to: route)
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.regularMaterial)
                    .shadow(radius: 3)


                VStack {
                    Text(title)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                        .fontWeight(.regular)
                        .font(.system(size: 18))
                        .fontDesign(Font.Design.monospaced)
                    //Sacar un modificador en shared
                }
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .padding([.top, .horizontal])
        })

    }
}

#Preview("HomeView") {
    VStack {
        @State var coordinator = NavigationCoordinator()
        HomeView()
            .environment(coordinator)
    }
}
