//
//  FlowerNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

class FlowerNode: SKNode {
    public let size: CGSize
    
    init(size: CGSize) {
        let multiplier = CGFloat.random(in: 0.5...1.0)
        self.size = .init(
            width: size.width * multiplier,
            height: size.height * multiplier
        )
        
        super.init()
        
        let sprite = SKSpriteNode(texture: Textures.flower, size: self.size)
        sprite.name = "Flower"
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.interactable
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.interactable
        
        self.physicsBody?.isDynamic = false
        
        addChild(sprite)
        self.name = "Flower"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
