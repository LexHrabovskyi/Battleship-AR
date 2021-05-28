//
//  BattleshipGameDelegateProtocol.swift
//  Battleship AR
//
//  Created by Александр on 05.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

protocol BattleshipGameDelegate: AnyObject {
    
    func changeGamePhase(_ phase: BattleshipPhases)
    
    // MARK: first phase
    func setShipPreview(_ ship: Ship, availableToSetHere: Bool)
    func setShip(_ ship: Ship)
    func enableClearFieldButton()
    func disableClearFieldButton()
    func clearPlayerField()
    func enableBeginBattleButton()
    func disableBeginBattleButton()
    
    // MARK: battle phase
    func hit(with hitResult: HitResult)
    
    // MARK: end of the game
    func enableRestartButton()
    
}
