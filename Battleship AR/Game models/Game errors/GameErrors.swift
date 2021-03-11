//
//  GameErrors.swift
//  Battleship AR
//
//  Created by Александр on 05.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

enum BattleshipError: Error {
    
    case needToLinkTheFieldsToTheModel
    case fieldIsAlreadyAdded
    case fieldLimitIsExceeded
    case cannotRemoveShipsAtThisGamePhase
    
}
