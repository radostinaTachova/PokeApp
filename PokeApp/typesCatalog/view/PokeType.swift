//
//  PokeType.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 19/6/25.
//

import SwiftUICore

struct PokeType {
    let id: UUID
    let name: String
    let color: Color
}

extension TypeEntity {
    func toUIModel() -> PokeType {
        PokeType(id: UUID(),
                 name: self.name,
                 color: typeColor)
    }
    
    private var typeColor: Color {
        switch name.lowercased() {
        case "fire": return .red
        case "water": return .blue
        case "grass": return .green
        case "electric": return .yellow
        case "psychic": return .purple
        case "ice": return .cyan
        case "fighting": return .orange
        case "dragon": return .indigo
        case "dark": return .gray
        case "fairy": return .pink
        default: return .teal
        }
    }
}
