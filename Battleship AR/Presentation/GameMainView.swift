//
//  GameMainView.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import SwiftUI

struct GameMainView: View {
    
    @EnvironmentObject var gamePhases: GamePhases
    
    var body: some View {
        
        ZStack {
            
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            MainMenuView()
            
        }
        
    }
    
}

#if DEBUG
struct GameMainView_Previews: PreviewProvider {
    static var previews: some View {
        GameMainView()
    }
}
#endif
