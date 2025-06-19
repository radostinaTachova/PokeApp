//
//  TypeEntity.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 19/6/25.
//

struct TypeEntity {
    let name: String
}

extension ResultTypeDTO {
    var toEntity : TypeEntity {
        return TypeEntity(name: self.name)
    }
}
