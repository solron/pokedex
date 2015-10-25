//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Ronny Soltveit on 24/10/15.
//  Copyright © 2015 Ronny Soltveit. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoText: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttack: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonName.text = pokemon.name
        var img = UIImage(named: "\(pokemon.pokedexID)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            // This will be called after download is done
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenceLbl.text = pokemon.defence
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexID)"
        weightLbl.text = pokemon.weight
        baseAttack.text = pokemon.attack
        if pokemon.nextEvolutionId == "" {
            evoText.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            if pokemon.nextEvolutionText != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            evoText.text = str
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
