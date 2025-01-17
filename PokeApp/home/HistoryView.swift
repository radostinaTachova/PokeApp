//
//  HistoryView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import SwiftUI

struct HistoryView: View {
    @Environment(NavigationCoordinator.self) private var coordinator

    var body: some View {
        VStack {
            HeaderView(title: "History")
            ScrollView {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut tellus urna. Donec a pulvinar velit. Nulla molestie lobortis dolor a dapibus. Nullam efficitur dolor sed luctus fermentum. Quisque cursus metus sapien, eget luctus risus lacinia sed. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla hendrerit malesuada ipsum vitae dictum. Sed accumsan felis at enim imperdiet, at scelerisque purus bibendum. Etiam luctus rutrum tempus. Sed ut ultrices velit. Donec et consectetur metus. Etiam a lectus in arcu posuere laoreet. Proin mauris nibh, dignissim ut vulputate vel, lacinia sit amet magna. Etiam sit amet purus sem. Proin rutrum metus enim, ut euismod diam hendrerit nec. Aliquam elementum enim vel euismod iaculis.")
                    .padding(50)
                
                Button("POKEMON") {
                    coordinator.navigate(to: .home(.pokemonOfTheDay))
                }
            }
        }.frame(maxHeight: .infinity, alignment: .topLeading)

    }
}

#Preview {
    VStack {
        @State var coordinator = NavigationCoordinator()
        HistoryView()
            .environment(coordinator)
    }
}
