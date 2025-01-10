//
//  APIConfiguration.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 26/12/24.
//
import Foundation
//RADOS igual añado interfaces aqui y hacerlo un poco más testable.
struct APIConfiguration {
    static let baseURL = "https://pokeapi.co/api/v2/"
}
//RADOS puede que esto sea mejor que sea una clase final, para que toda la aplicación use la misma instancia y no se hagan copias de esta.
struct APIClient {
    private let shared = URLSession.shared

    func get(enpoint: String) async throws -> (Data, URLResponse) {
        let urlString = APIConfiguration.baseURL + enpoint
        guard let url = URL(string: urlString) else {
            throw PokeError.invalidUrl
        }
        let (data , response) = try await shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokeError.invalidResponse
        }
        
        return (data, response)
    }
}

enum PokeError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
