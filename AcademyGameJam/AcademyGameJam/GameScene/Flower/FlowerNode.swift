//
//  FlowerNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

class FlowerNode: SKSpriteNode {
    var interactionEnabled: Bool = true
    let hasProgressionBar: Bool = true
    
    private let pollen: Float
    
    weak var pollenDelegate: (any PollenDelegate)?
    
    init(size: CGSize, pollenMultiplier: Float) {
        let multiplier = CGFloat.random(in: 0.5...1.0)
        let trueSize = CGSize.init(width: size.width * multiplier, height: size.height * multiplier)
        
        self.pollen = Float(trueSize.width + trueSize.height)/2 * pollenMultiplier
        
        super.init(texture: Textures.flower, color: .clear, size: trueSize)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: trueSize)
        self.physicsBody?.isDynamic = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.interactable
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.interactable
        
        self.zPosition = Layers.Interactable
        
        self.name = "Flower"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FlowerNode: Interactable {
    func startInteraction() {
        self.interactionEnabled = false
        pollenDelegate?.increasePollen(pollen)
    }
}
