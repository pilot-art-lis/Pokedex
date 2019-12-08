//
//  PokemonFetcher.swift
//  PokemonCycler
//
//  Created by Jan on 07/12/2019.
//  Copyright © 2019 iOS4Beginners. All rights reserved.
//

import Foundation

protocol PokemonFetcher {
    func fetchPokemon(_ pokemonID: Int, completion: @escaping (Pokemon?) -> Void)
    func catchPokemon(_ pokemonID: Int, completion: @escaping (Pokemon?) -> Void)
}

class PokemonFetcherImpl: PokemonFetcher {

    let deviceIdentifier: String

    private let pokemonIndexURL = "https://switter.app.daftmobile.com/api/pokemon/"

    init(deviceId: String) {
        self.deviceIdentifier = deviceId
    }

    func fetchPokemon(_ pokemonID: Int, completion: @escaping (Pokemon?) -> Void) {
        let urlSession = URLSession(configuration: .ephemeral)
        let request = createPokemonRequest(pokemonID)
        urlSession.dataTask(with: request) { (data, response, error) in
            var pokemon: Pokemon? = nil
            defer {
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            }

            guard error == nil else { print(error!); return }
            guard let data = data else { return }

            do {
                pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            } catch {
                print("Unexpected data: \(String(data: data, encoding: .utf8) ?? "")")
            }

        }.resume()
    }
    
    func catchPokemon(_ pokemonID: Int, completion: @escaping (Pokemon?) -> Void) {
        let session = URLSession.shared
        let request = createCatchRequest(pokemonID)
        session.dataTask(with: request) { (data, response, error) in
            var pokemon: Pokemon? = nil
            defer {
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            }
            
            guard error == nil else { print(error!); return }
            guard let data = data else { return }
            
            do {
                pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            } catch {
                print("Unexpected data: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }.resume()
    }

    private func createPokemonRequest(_ pokemonID: Int) -> URLRequest {
        let pokemonURLNumber: String = pokemonIndexURL + "\(pokemonID)"
        let url = URL(string: pokemonURLNumber)!
        var request = URLRequest(url: url)
        request.addValue(deviceIdentifier, forHTTPHeaderField: "x-device-uuid")
        return request
    }
    
    private func createCatchRequest(_ pokemonID: Int) -> URLRequest {
        let pokemonURLNumber: String = pokemonIndexURL + "\(pokemonID)" + "/catch"
        let url = URL(string: pokemonURLNumber)!
        var request = URLRequest(url: url)
        request.addValue(deviceIdentifier, forHTTPHeaderField: "x-device-uuid")
        request.httpMethod = "POST"
        return request
    }
}
