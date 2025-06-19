//
//  PokeTypesView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 19/12/24.
//

import SwiftUI

struct PokeTypesView: View {
    
    @State var viewModel: PokeTypesViewModel
    @State private var selectedType: TypeDTO? = nil


    // Diseño: 2 columnas
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            Group {
                if let types = viewModel.types {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(types, id: \.id) { type in
                                TypeCardView(type: type)
                            }
                        }
                        .padding()
                    }
                } else {
                    Text("NO TYPES")
                }
            }
    }
}

#Preview {
    //PokeTypesView(viewModel: <#PokeTypesViewModel#>)
}


struct TypeCardView: View {
    let type: PokeType

    var body: some View {
        VStack {
            Text(type.name.capitalized)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(type.color)
                .cornerRadius(12)
        }
    }
    }
}
