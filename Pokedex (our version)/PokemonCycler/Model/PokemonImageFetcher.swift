//
//  PokemonImageFetcher.swift
//  PokemonCycler
//
//  Created by Best Mac on 11/30/19.
//  Copyright © 2019 iOS4Beginners. All rights reserved.
//

import Foundation
import UIKit

protocol PokemonImageFetcher {
    func fetchPokemonImage(_ pokemonID: Int, completionHandler: @escaping (_ data: Data?) -> Void)
}

class PokemonImageFetcherImpl: PokemonImageFetcher {

    let deviceIdentifier: String

    private let pokemonIndexURL = "https://switter.app.daftmobile.com/api/pokemon/"

    init(deviceId: String) {
        self.deviceIdentifier = deviceId
    }

    func fetchPokemonImage(_ pokemonID: Int, completionHandler: @escaping (_ data: Data?) -> Void) {
        let urlSession = URLSession.shared
        let request = createPokemonImageRequest(pokemonID)
        urlSession.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                completionHandler(nil)
            } else {
                    DispatchQueue.main.async {
                        completionHandler(data)
                    }
                }
            
            guard error == nil else { print(error!); return }
            
        }.resume()  
    }

    private func createPokemonImageRequest(_ pokemonID: Int) -> URLRequest {
        let pokemonURLNumber: String = pokemonIndexURL + "\(pokemonID)" + "/image"
        let url = URL(string: pokemonURLNumber)!
        var request = URLRequest(url: url)
        request.addValue(deviceIdentifier, forHTTPHeaderField: "x-device-uuid")
        return request
    }
}
