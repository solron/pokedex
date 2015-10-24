//
//  Pokemon.swift
//  pokedex
//
//  Created by Ronny Soltveit on 24/10/15.
//  Copyright © 2015 Ronny Soltveit. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}