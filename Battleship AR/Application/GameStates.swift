//
//  GamePhases.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Combine

final class GameStates: ObservableObject {
    
    @Published var appPhase: AppPhases = .mainMenu
    @Published var gamePhase: GamePhases? = nil
    var showMainMenu: Bool {
        appPhase == .mainMenu || appPhase == .gamePaused
    }
    
    enum AppPhases {
        
        case mainMenu
        case startingNewGame
        case loadingLastGame
        case game
        case gamePaused
        
    }
    
    enum GamePhases {
        
        case shipPlacement
        case firstPlayerTurn
        case secondPlayerTurn
        // some animations like explosion, when no one can change anything
        case action
        
    }
    
}
