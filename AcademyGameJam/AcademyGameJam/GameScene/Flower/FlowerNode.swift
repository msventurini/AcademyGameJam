//
//  FlowerNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

class FlowerNode: SKSpriteNode {
    let points: Float
    var hasBeenInteracted: Bool = false
    
    init(size: CGSize, pointsMultiplier: Float) {
        let multiplier = CGFloat.random(in: 0.5...1.0)
        let trueSize = CGSize.init(width: size.width * multiplier, height: size.height * multiplier)
        
        self.points = Float(trueSize.width + trueSize.height)/2 * pointsMultiplier
        
        super.init(texture: Textures.flower, color: .clear, size: trueSize)
        
        self.name = "Flower"
        
        self.physicsBody = SKPhysicsBody(rectangleOf: trueSize)
        self.physicsBody?.isDynamic = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.interactable
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.interactable        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
