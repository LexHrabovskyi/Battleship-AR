//
//  ViewController.swift
//  Battleship AR
//
//  Created by Александр on 01.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    private let enemyFieldOffset: Float = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainAnchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.4, 0.6])
        arView.scene.addAnchor(mainAnchor)
        addTheSea(toAnchor: mainAnchor)
        addSeaFields(toAnchor: mainAnchor)
        
    }
    
    private func addTheSea(toAnchor anchor: AnchorEntity) {
        
        let seaMesh = MeshResource.generateBox(width: 0.8, height: 0.01, depth: 0.5)
        let seaMetarial = SimpleMaterial(color: .blue, roughness: .float(0.05), isMetallic: false)
        let model = ModelEntity(mesh: seaMesh, materials: [seaMetarial])
        model.position = [0, -0.01, 0]
        anchor.addChild(model)
        
    }
    
    private func addSeaFields(toAnchor anchor: AnchorEntity) {
        
        var seaFields = [Entity]()
        for _ in 1...100 {
            
            let fieldMesh = MeshResource.generateBox(width: 0.02, height: 0.005, depth: 0.02)
            let waterMaterial = SimpleMaterial(color: .cyan, roughness: .float(0.2), isMetallic: false)
            let fieldModel = ModelEntity(mesh: fieldMesh, materials: [waterMaterial])
            fieldModel.generateCollisionShapes(recursive: true)
            seaFields.append(fieldModel)
            
        }
        
        for (index, field) in seaFields.enumerated() {
            
            let x = Float(index % 10)
            let z = Float(index / 10)
            field.position = [enemyFieldOffset + x * 0.022, 0, z * 0.022]
            anchor.addChild(field)
            
        }
        
    }
    
    
    
}
