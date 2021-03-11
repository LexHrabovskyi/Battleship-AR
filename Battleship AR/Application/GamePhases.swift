//
//  GamePhases.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Combine

final class GamePhases: ObservableObject {
    
    @Published var current: Phase = .mainMenu
    
    enum Phase {
        
        case mainMenu
        case startingNewGame
        case loadingLastGame
        case game
        case gamePaused
        
    }
    
}
