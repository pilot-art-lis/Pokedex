//
//  Pokemon.swift
//  PokemonCycler
//
//  Created by Best Mac on 11/30/19.
//  Copyright © 2019 iOS4Beginners. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    var number: Int
    var name: String
    var color: Int
}

enum PokemonError {
    case conectionTroubles
}
