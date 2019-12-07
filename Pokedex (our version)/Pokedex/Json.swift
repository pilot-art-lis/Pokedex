//
//  Json.swift
//  PokemonCycler
//
//  Created by Best Mac on 11/30/19.
//  Copyright © 2019 iOS4Beginners. All rights reserved.
//

import Foundation

class JsonRead {
    
    func loadJson() -> [Pokemon] {
        var pokemons: [Pokemon] = []
            
            if let url = Bundle.main.url(forResource: "pokemon_list", withExtension: "json") {
                    do {
                        if let data = try? Data(contentsOf: url) {
                                let decoder = JSONDecoder()
                                pokemons = try decoder.decode([Pokemon].self, from: data)
                        }
                    } catch {
                        print("Error!! Unable to parse pokemon_list.json")
                    }
                }
        
            return pokemons
        }
}
