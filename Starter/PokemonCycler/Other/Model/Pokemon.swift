import Foundation
import UIKit

struct Pokemon: Codable {
	let number: Int
	let name: String
	let color: Int
	let types: [PokemonType]
	let weaknesses: [PokemonType]
}

extension Pokemon {
	var colorValue: UIColor { .init(hex: color) }
}
