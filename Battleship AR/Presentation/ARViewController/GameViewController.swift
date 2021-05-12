//
//  ViewController.swift
//  Battleship AR
//
//  Created by Александр on 01.09.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import RealityKit
import Combine

final class GameViewController: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    
    private let enemyFieldOffset: Float = 0.15
    
    init() {
        // TODO: need to place gameModel: BattleshipGame
        super.init(nibName: "GameViewController", bundle: Bundle.main)
    }
    
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
        for iterator in 1...100 {
            
            let fieldMesh = MeshResource.generateBox(width: 0.02, height: 0.005, depth: 0.02)
            let waterMaterial = SimpleMaterial(color: .cyan, roughness: .float(0.2), isMetallic: false)
            let fieldModel = ModelEntity(mesh: fieldMesh, materials: [waterMaterial])
            fieldModel.name = "Second player field \(iterator)"
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
    
    // MARK: - interactions
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        
        let tapLocation = sender.location(in: arView)
        guard let touchedField = arView.entity(at: tapLocation) else { return }
        guard isEnemyEmptyField(touchedField) else { return }
        
        let maskMesh = MeshResource.generateBox(width: 0.022, height: 0.01, depth: 0.022)
        let maskMaterial = SimpleMaterial(color: .yellow, roughness: .float(0.3), isMetallic: false)
        let touchedFieldMask = ModelEntity(mesh: maskMesh, materials: [maskMaterial])
        touchedFieldMask.name = "Field mask"
        touchedFieldMask.generateCollisionShapes(recursive: true)
        
        touchedField.addChild(touchedFieldMask)
        
    }
    
    private func isEnemyEmptyField(_ entity: Entity) -> Bool {
        
        // TODO: check the player in multiplayer
        return entity.name.contains("Second player field")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
}
