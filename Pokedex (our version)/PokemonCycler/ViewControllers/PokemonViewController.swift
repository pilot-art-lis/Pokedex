import UIKit

class PokemonViewController: UIViewController {

    var pokemonID: Int = 1
    var initialScreen: Bool = true
    
    var pokemonFetcher: PokemonFetcher!
    var imageFetcher: PokemonImageFetcher!
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var topSeparator: UIView!
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNum: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? "unknown_device"
        pokemonFetcher = PokemonFetcherImpl(deviceId: deviceID)
        imageFetcher = PokemonImageFetcherImpl(deviceId: deviceID)
        nextPokemon(pokemonID)
        swiping()
        tapping()
        twoFingersTapping()
    }
        
    @IBAction func nextPokemon(_ i: Int) {
        
        pokemonFetcher.fetchPokemon(i, completion: { [weak self] pokemon in
            self?.indicator.startAnimating()
            //self?.pokemonName.isHidden = false
            self?.pokemonName.text = pokemon?.name ?? "Failed\n" + "Try again"
            self?.pokemonNum.text = ("\(pokemon?.number ?? 0)")
            self?.background.backgroundColor = UIColor(hex: pokemon?.color ?? 7237230)
            self?.topSeparator.backgroundColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.bottomSeparator.backgroundColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.pokemonName.textColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.pokemonNum.textColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.indicator.stopAnimating()
        })
        
            imageFetcher.fetchPokemonImage(i, completionHandler: { [weak self] imageData in
            if let data = imageData {
                DispatchQueue.main.async {
                    self?.indicator.stopAnimating()
                    self?.pokemonImage.image = UIImage(data: data)
                }
            } else {
                print("Error loading image")
            }
        })
    }
    
    @IBAction func catchPokemon(_ i: Int) {
        
        pokemonFetcher.catchPokemon(i, completion: { [weak self] pokemon in
            self?.indicator.startAnimating()
            //self?.pokemonName.isHidden = false
            self?.pokemonName.text = pokemon?.name ?? "Failed\n" + "Try again"
            self?.pokemonNum.text = ("\(pokemon?.number ?? 0)")
            self?.background.backgroundColor = UIColor(hex: pokemon?.color ?? 7237230)
            self?.topSeparator.backgroundColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.bottomSeparator.backgroundColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.pokemonName.textColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.pokemonNum.textColor = UIColor(hex: pokemon?.color ?? 7237230).darkenColor()
            self?.indicator.stopAnimating()
        })
        
        imageFetcher.fetchPokemonImage(i, completionHandler: { [weak self] imageData in
            if let data = imageData {
                DispatchQueue.main.async {
                    self?.indicator.stopAnimating()
                    self?.pokemonImage.image = UIImage(data: data)
                }
            } else {
                print("Error loading image")
            }
        })
    }
    
    func tapping() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        background.addGestureRecognizer(tap)
    }
    
    func twoFingersTapping() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTouchesRequired = 2
        background.addGestureRecognizer(tap)
    }
    
    func swiping() {
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(fingerSwipe))
        swipeUP.direction = UISwipeGestureRecognizer.Direction.up
        self.background.addGestureRecognizer(swipeUP)
        fingerSwipe()
    }
    
    @objc func handleTap() {
        pokemonID += 1
        nextPokemon(pokemonID)
    }
    
    @objc func doubleTapped() {
        if pokemonID == 1 {
            return
        } else {
            pokemonID -= 1
        }
        nextPokemon(pokemonID)
    }
    
    @objc func fingerSwipe() {
        catchPokemon(pokemonID)
    }
}
