//
//  GameMainView.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import SwiftUI

struct GameMainView: View {
    
    @EnvironmentObject var gamePhases: GameStates
    
    var body: some View {
        
        ZStack {
            
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            GameControlsView()
            
        }
        
    }
    
}

#if DEBUG
struct GameMainView_Previews: PreviewProvider {
    static var previews: some View {
        GameMainView()
            .environmentObject(GameStates())
    }
}
#endif
