import Foundation
import UIKit

enum PokemonType: String, Codable {
	case bug
	case dark
	case dragon
	case electric
	case fairy
	case fighting
	case fire
	case flying
	case ghost
	case grass
	case ground
	case ice
	case normal
	case poison
	case psychic
	case rock
	case steel
	case water
}

extension PokemonType {
	var icon: UIImage {
		switch self {
			case .bug: return #imageLiteral(resourceName: "bug")
			case .dark: return #imageLiteral(resourceName: "dark")
			case .dragon: return #imageLiteral(resourceName: "dragon")
			case .electric: return #imageLiteral(resourceName: "electric")
			case .fairy: return #imageLiteral(resourceName: "fairy")
			case .fighting: return #imageLiteral(resourceName: "fighting")
			case .fire: return #imageLiteral(resourceName: "fire")
			case .flying: return #imageLiteral(resourceName: "flying")
			case .ghost: return #imageLiteral(resourceName: "ghost")
			case .grass: return #imageLiteral(resourceName: "grass")
			case .ground: return #imageLiteral(resourceName: "ground")
			case .ice: return #imageLiteral(resourceName: "ice")
			case .normal: return #imageLiteral(resourceName: "normal")
			case .poison: return #imageLiteral(resourceName: "poison")
			case .psychic: return #imageLiteral(resourceName: "psychic")
			case .rock: return #imageLiteral(resourceName: "rock")
			case .steel: return #imageLiteral(resourceName: "steel")
			case .water: return #imageLiteral(resourceName: "water")
		}
	}
}
