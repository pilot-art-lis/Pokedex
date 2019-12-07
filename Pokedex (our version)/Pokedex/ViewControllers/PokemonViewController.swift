import UIKit

class PokemonViewController: UIViewController {

    var pokemon = JsonRead()
    var pokemonID: Int = 0
    let POKEMONS_NUMBER: Int = 18
    var initialScreen: Bool = true
    
    var fetcher: PokemonFetcher!
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var topSeparator: UIView!
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNum: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPokemon(pokemonID)
        tapping()
        twoFingersTapping()
        let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? "unknown_device"
        fetcher = PokemonFetcherImpl(deviceId: deviceID)
    }
        
    @IBAction func setPokemon(_ i: Int) {
        
        
//       fetcher.fetchPokemon { [weak self] pokemon in
//                self?.pokemonImage.image = pokemon?.pokemonImage
//            }
        
        
        
        pokemonName.text = pokemon.loadJson()[i].name
        background.backgroundColor = UIColor(hex: pokemon.loadJson()[i].color)
        pokemonName.textColor = UIColor(hex: pokemon.loadJson()[i].color).darkenColor()
        topSeparator.backgroundColor = UIColor(hex: pokemon.loadJson()[i].color).darkenColor()
        bottomSeparator.backgroundColor = UIColor(hex: pokemon.loadJson()[i].color).darkenColor()
    }
    
    func tapping() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        background.addGestureRecognizer(tap)
    }
    
    func twoFingersTapping() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTouchesRequired = 2
        background.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if pokemonID == POKEMONS_NUMBER-1 {
            pokemonID = 0
        } else {
            pokemonID += 1
        }
        setPokemon(pokemonID)
      //  updateViews()
    }
    
    @objc func doubleTapped() {
        if pokemonID == 0 {
            return
        } else {
            pokemonID -= 1
        }
        setPokemon(pokemonID)
        //updateViews()
    }
    
   /* private func updateViews() {
        self.pokemonName.setNeedsDisplay()
        self.pokemonWeakness.setNeedsDisplay()
        self.leftIcon.setNeedsDisplay()
        self.rightIcon.setNeedsDisplay()
        self.bottomIcon.setNeedsDisplay()
        self.background.setNeedsDisplay()
        self.topSeparator.setNeedsDisplay()
        self.bottomSeparator.setNeedsDisplay()
    }*/
}
