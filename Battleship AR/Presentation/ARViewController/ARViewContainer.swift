//
//  ARViewContainer.swift
//  Battleship AR
//
//  Created by Александр on 11.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import SwiftUI
import RealityKit
import Combine

final class SceneDependencies {
    
    var cancellables: Set<AnyCancellable> = []
    
}

struct ARViewContainer: UIViewControllerRepresentable {
    
    @EnvironmentObject var gamePhases: GameStates
    typealias UIViewControllerType = GameViewController
    
    // TODO: make a normal dependency
    let dependencies = SceneDependencies()
    
    func makeUIViewController(context: Context) -> GameViewController {
        
        let arViewController = GameViewController()
        
        gamePhases.$appPhase
            .filter { $0 == .startingNewGame }
            .sink { _ in
            
                arViewController.resetScene()
                arViewController.setupScene()
                gamePhases.appPhase = .game
                
        }
            .store(in: &dependencies.cancellables)
        
        return arViewController
        
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) { }
    
}
