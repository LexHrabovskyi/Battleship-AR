//
//  MainMenu.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var gamePhases: GamePhases
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.3972030539)))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text("Main menu")
                    .bold()
                    .foregroundColor(.white)
                
                Text("Begin game")
                    .onTapGesture {
                        print("changing state")
                        self.gamePhases.current = .game
                    }
                
            }
            
            
        }
        .isHidden(gamePhases.current != .mainMenu && gamePhases.current != .gamePaused)
        
    }
}

#if DEBUG
struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
#endif
