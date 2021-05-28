//
//  BattlefieldModel.swift
//  Battleship AR
//
//  Created by Александр on 06.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import Combine

class BattlefieldModel: Battlefield {
    
    var fields: [SeaField] = []
    var ships: [Ship] = [] // TODO: init with the game rules (1 carrier, 2 battleships ...)
    
    func addField(_ field: SeaField) throws {
        
        // TODO: check the field can be added, throw error in cases:
        // 1. check the fields limit (not more than 100)
        // 2. check the field didn't added before (the same position or entity name)
        // 3. chech the added field is next to the previous (according to previous column):
        // 3.1. next column, if the previous is not 10th
        // 3.2. next row, if the previous column is 10th
        // 4. add the new field
        fields.append(field)
    }
    
    func nextField(from field: SeaField, to direction: Direction) -> SeaField? {
        
        // TODO: return the nearest field according to direction:
        // 1. right:
        // 1.1. index + 1 if it's not the 10th column
        // 1.2. nil, if it's 10th column
        // 2. left:
        // 2.1. index - 1, if it's not the first column
        // 2.2. nil, if it's the first column
        // 3. up:
        // 3.1. index - 10 if it's not the first row
        // 3.2. nil if it's the first row
        // 4. down:
        // 4.1. index + 10 if it's not the 10th row
        // 4.2. nil if it's the 10th row
        return nil
    }
    
    func hitField(at field: SeaField) -> HitResult {
        
        // TODO: check the hitted field:
        // 1. add the array of hitted fields
        // 2. check the current field is not in the hitted fields array:
        // 2.1. if yes - return missed
        // 2.2. if no - add current field to hitted fields array
        // 3. chech current field intersects with any ship location
        // 3.1. case intersects:
        //   hit the ship
        //   check ship's lifepoints
        //   if 0 - return destroyed ship
        //   if > 0 - return hitted field
        return .missed(field)
    }
    
    func removeShipsFromTheField() {
        
        // TODO: maybe need some checks before
        // 1. Ship class should have the "confirmed" property
        // 2. change this property for all the ships
        ships.removeAll()
        
    }
    
    func canPutShip(_ ship: Ship, inLocation location: [SeaField]) -> Bool {
        
        // TODO: add the methods for checking all the restricted fields
        // 1. get all the "confirmed location" ships
        // 2. calculate all the restricted fields (which are busy with ship or the nearest fields)
        // 3. check the location is not intersects with restricted fields
        return true
    }
    
    func allShipsDestroyed() -> Bool {
        // TODO: check all the ships destroyed:
        // add the flag ships are destroyed to true
        // check the ships in the loop
        //   if destroyed - continue
        //   if not destroyed - change flag to false, break
        // return flag
        return false
    }
    
    func shipsNeedToBePlaced() -> [Ship] {
        
        // TODO: return all the ships the user need to place
        // 1. Ship class should have the "confirmed" property
        // 2. init all the ships with false confirmed property
        // 3. return the ships with filter "not confirmed"
        return []
    }
    
}
