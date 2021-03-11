//
//  FieldModel.swift
//  Battleship AR
//
//  Created by Александр on 05.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class SeaField {
    
    let row: Int
    let col: Int
    let entityName: String
    var didInterruct: Bool
    
    init(row: Int, col: Int, entityName: String) {
        
        self.row = row
        self.col = col
        self.entityName = entityName
        self.didInterruct = false
        
    }
    
}
