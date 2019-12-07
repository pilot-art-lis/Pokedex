//
//  PokemonFetcher.swift
//  PokemonCycler
//
//  Created by Jan on 07/12/2019.
//  Copyright © 2019 iOS4Beginners. All rights reserved.
//

import Foundation

protocol PokemonFetcher {
    func fetchPokemon(completion: @escaping (Pokemon?) -> Void)
}

class PokemonFetcherImpl: PokemonFetcher {

    let urlSession = URLSession(configuration: .ephemeral)
    let deviceIdentifier: String

    private let pokemonURLString = "https://switter.app.daftmobile.com/api/pokemon"

    init(deviceId: String) {
        self.deviceIdentifier = deviceId
    }

    func fetchPokemon(completion: @escaping (Pokemon?) -> Void) {

        let request = createPokemonRequest()

        urlSession.dataTask(with: request) { (data, response, error) in
            var pokemon: Pokemon? = nil
            defer {
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            }

            // 0. Check for errors
            guard error == nil else { print(error!); return }
            guard let data = data else { return }

            // 1. Parse the pokemon
            do {
                pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            } catch {
                print("Unexpected data: \(String(data: data, encoding: .utf8) ?? "")")
            }

        }.resume()
    }

    private func createPokemonRequest() -> URLRequest {
        let url = URL(string: pokemonURLString)!
        var request = URLRequest(url: url)
        request.addValue(deviceIdentifier, forHTTPHeaderField: "x-device-uuid")
        return request
    }
}
