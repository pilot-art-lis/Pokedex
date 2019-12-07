import UIKit

class PokemonViewController: UIViewController {

	@IBOutlet weak var pokemonNameLabel: UILabel!
	@IBOutlet weak var bottomLineView: UIView!
	@IBOutlet weak var topLineView: UIView!

	private var pokemonLoader: PokemonLoader!

	private func refresh(pokemon: Pokemon) {
		pokemonNameLabel.text = pokemon.name
		pokemonNameLabel.textColor = pokemon.colorValue.darkenColor()
		bottomLineView.backgroundColor = pokemon.colorValue.darkenColor()
		topLineView.backgroundColor = pokemon.colorValue.darkenColor()
		view.backgroundColor = pokemon.colorValue
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		pokemonLoader = PokemonLoaderImpl()
		refresh(pokemon: pokemonLoader.current)

		let oneFingerTap = UITapGestureRecognizer(target: self, action: #selector(toggleUp))
		let twoFingerTap = UITapGestureRecognizer(target: self, action: #selector(toggleDown))
		twoFingerTap.numberOfTouchesRequired = 2

		view.addGestureRecognizer(oneFingerTap)
		view.addGestureRecognizer(twoFingerTap)
	}

	@objc func toggleUp() {
		refresh(pokemon: pokemonLoader.next())
	}

	@objc func toggleDown() {
		refresh(pokemon: pokemonLoader.previous())
	}
}
