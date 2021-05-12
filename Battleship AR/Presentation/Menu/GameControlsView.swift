//
//  MainMenu.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import SwiftUI

struct GameControlsView: View {
    
    @EnvironmentObject var gameState: GameStates
    
    var body: some View {
        
        if gameState.showMainMenu {
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.menuColor)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    Text("Main menu")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Begin new game")
                        .bold()
                        .foregroundColor(.white)
                        .onTapGesture {
                            print("beginning a new game")
                            self.gameState.appPhase = .startingNewGame
                        }
                    
                    if gameState.appPhase != .mainMenu {
                        
                        Text("Return")
                            .bold()
                            .foregroundColor(.white)
                            .onTapGesture {
                                print("returning")
                                self.gameState.appPhase = .game
                            }
                        
                    }
                    
                }
                
            }
            
        } else {
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        gameState.appPhase = .gamePaused
                    }, label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(.menuColor)
                            
                            Image(systemName: "pause.circle")
                                .font(.system(size: 32))
                            
                        }
                        
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 50, height: 50)
                    
                }
                .padding()
                
                Spacer()
            }
            
        }
        
    }
    
}

#if DEBUG
struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameControlsView()
            .environmentObject(GameStates())
    }
}
#endif
