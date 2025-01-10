//
//  HeaderView.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .bottomLeading)
        .padding([.bottom, .leading], 20)
        .background(Color(.primary))
    }
}

#Preview {
    HeaderView(title: "Pokemon Of The day")
}
