//
//  Pokemon.swift
//  PokemonCycler
//
//  Created by Best Mac on 11/30/19.
//  Copyright © 2019 iOS4Beginners. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon: Codable {

    var number: Int
    var weaknesses: [String]
    var types: [String]
    var name: String
    var colorText: String
    var color: Int
    

//    guard var url = Bundle.main.url(forResource: "pokemon_list", withExtension: "json") else { print("Error!! Unable to parse pokemon_list.json"); return }
//    guard var data = try? Data(contentsOf: url) else { print("Error!! Unable to parse pokemon_list.json"); return }
        //var jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
    
//    init(_ number: Int, _ weaknesses: [String], _ types: [String], _ name: String, _ colorText: String, _ color: Int) {
//        self.number = number
//        self.weaknesses = weaknesses
//        self.types = types
//        self.name = name
//        self.colorText = colorText
//        self.color = color
//    }
}
