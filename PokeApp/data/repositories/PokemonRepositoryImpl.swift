//
//  PokemonRepositoryImpl.swift
//  PokeApp
//
//  Created by Radostina Tachova Chergarska on 10/1/25.
//
import Foundation

struct PokemonRepositoryImpl: PokemonRepository {

    let baseURL = APIConfiguration.baseURL
    let apiSession: APIClient

    init(apiSession: APIClient = APIClient()) {
        self.apiSession = apiSession
    }

    func getPokemon(with id: Int) async throws -> PokemonDTO {
        let enpoint = "pokemon/\(String(id))/"

        let (data , _) = try await apiSession.get(enpoint: enpoint)

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(PokemonDTO.self, from: data)
        } catch {
            throw PokeError.invalidData
        }
    }
}
