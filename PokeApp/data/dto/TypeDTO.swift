//
//  TypeDTO.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 18/6/25.
//

struct PaginatedTypeListDTO: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [ResultTypeDTO]
}

struct ResultTypeDTO : Codable {
    let name: String
    let url: String
}

struct TypeDTO: Codable {
    let id: Int
    let name: String
    let damage_relations: PokemonSpritesDTO?
}

struct TypeRelationsDTO: Codable {
    let noDamageTo: [TypeDTO]
    let halfDamageTo: [TypeDTO]
    let doubleDamageTo: [TypeDTO]
    let noDamageFrom: [TypeDTO]
    let halfDamageFrom: [TypeDTO]
    let doubleDamageFrom: [TypeDTO]
    
    enum CodingKeys: String, CodingKey {
        case noDamageTo = "no_damage_to"
        case halfDamageTo = "half_damage_to"
        case doubleDamageTo = "double_damage_to"
        case noDamageFrom = "no_damage_from"
        case halfDamageFrom = "half_damage_from"
        case doubleDamageFrom = "double_damage_from"
    }
}
