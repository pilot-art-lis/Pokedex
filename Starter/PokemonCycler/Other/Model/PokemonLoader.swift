import Foundation

protocol PokemonLoader {
	var current: Pokemon { get }
	func next() -> Pokemon
	func previous() -> Pokemon
}

class PokemonLoaderImpl: PokemonLoader {

	private let pokemonList: [Pokemon]

	private var currentIndex: Int = 0 {
		didSet {
			currentIndex = (currentIndex + pokemonList.count) % pokemonList.count
		}
	}

	init() {
		guard let url = Bundle.main.url(forResource: "pokemon_list", withExtension: "json") else { fatalError("Could not find file with pokemon") }
		do {
			let data = try Data(contentsOf: url)
			pokemonList = try JSONDecoder().decode([Pokemon].self, from: data)
		} catch {
			fatalError("Could not load Pokemon from data: \(error)")
		}
	}

	var current: Pokemon { return pokemonList[currentIndex] }

	func next() -> Pokemon {
		currentIndex += 1
		return current
	}

	func previous() -> Pokemon {
		currentIndex -= 1
		return current
	}
}
