//
//  TypesUserCase.swift
//  PokeApp
//
//  Created by Radostina Linkedin on 18/6/25.
//

protocol TypesUseCase {
    mutating func execute() async -> [TypeEntity]? 
}
