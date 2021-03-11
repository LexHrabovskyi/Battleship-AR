//
//  BattleshipGameProtocol.swift
//  Battleship AR
//
//  Created by Александр on 05.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

protocol BattleshipGame: class {
    
    var delegate: BattleshipGameDelegate? { get set }
    var round: Int { get }
    var turn: PlayerTurn { get }
    var firstPlayerType: PlayerType { get }
    var secondPlayerType: PlayerType { get }
    
    // MARK: first phase of the game
    func beginGame() throws
    func clearBattlefield() throws
    func rotateShip(_ ship: Ship)
    func moveShip(_ ship: Ship, to direction: Direction)
    func confirmShipLocation(_ ship: Ship)
    
    // MARK: second phase of the game
    func beginBattle() throws
    func fire(fieldName: String)
    
    // MARK: game ended
    func restartGame()
    
    // MARK: game saving
    func saveGame()
    func canLoadGame() -> Bool
    func loadGame() throws
    
}
