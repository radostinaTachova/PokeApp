//
//  PokemonOfTheDayEntity.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//

import Foundation
import SwiftData
@Model
class PokemonOfTheDayEntity {
    var name: String
    var height: Int
    var imageUrl: String
    var date: String

    init(name: String, height: Int, imageUrl: String, date: String) {
        self.name = name
        self.height = height
        self.imageUrl = imageUrl
        self.date = date
    }
}

//Igual esto hay que moverlo a la capa de vista?¿?
extension PokemonOfTheDayEntity {
    func toModel() -> Pokemon {
        Pokemon(name: self.name,
                height: self.height,
                imageUrl: self.imageUrl)
    }
}
