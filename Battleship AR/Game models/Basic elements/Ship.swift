//
//  Ship.swift
//  Battleship AR
//
//  Created by Александр on 05.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class Ship {
    
    var dislocation: [SeaField]
    let type: ShipType
    let entityName: String
    private(set) var lifePoints: Int
    private(set) var isDestroyed: Bool
    
    init(ofType shipType: ShipType, withName name: String) {
        
        self.entityName = name
        self.dislocation = []
        self.type = shipType
        self.lifePoints = shipType.rawValue
        self.isDestroyed = false
        
    }
    
    func hit() {
        guard lifePoints != 0 else { return }
        lifePoints -= 1
        isDestroyed = (lifePoints == 0)
    }
    
}
