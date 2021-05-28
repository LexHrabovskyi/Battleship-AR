//
//  AppDelegate.swift
//  Battleship AR
//
//  Created by Александр on 01.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let contentView = GameMainView()
            .environmentObject(GameStates())
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.rootViewController = UIHostingController(rootView: contentView)
        window.makeKeyAndVisible()
        self.window = window
        return true
        
    }

}

