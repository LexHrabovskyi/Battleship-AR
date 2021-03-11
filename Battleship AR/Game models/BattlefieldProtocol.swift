//
//  Battlefield.swift
//  Battleship AR
//
//  Created by Александр on 05.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

protocol Battlefield {
    
    var fields: [SeaField] { get }
    var ships: [Ship] { get }
    
    // MARK: sea fields
    func addField(_ field: SeaField) throws
    func nextField(from field: SeaField, to direction: Direction) -> SeaField?
    func hitField(at field: SeaField) -> HitResult
    
    // MARK: ships
    func removeShipsFromTheField()
    func canPutShip(_ ship: Ship, inLocation location: [SeaField]) -> Bool
    func allShipsDestroyed() -> Bool
    func shipsNeedToBePlaced() -> [Ship]
    
}
