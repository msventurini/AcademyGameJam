//
//  PollutionNode.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 05/05/24.
//

import Foundation
import SpriteKit

class PollutionNode: SKSpriteNode {
    var interactionEnabled: Bool = true
    let hasProgressionBar: Bool = false
    
    weak var pollenDelegate: (any PollenDelegate)?
    weak var playerDelegate: (any PlayerDelegate)?
    
    init(position: CGPoint) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 500, height: 500))
        
        self.colorBlendFactor = 1.0
        self.position = position
        
        let pb = SKPhysicsBody(circleOfRadius: self.size.width / 2)
        
        pb.isDynamic = true
        
        pb.categoryBitMask = PhysicsCategory.enemy
        pb.contactTestBitMask = PhysicsCategory.player
        pb.collisionBitMask = PhysicsCategory.enemy
        
        self.physicsBody = pb
        
        let emitter = SKEmitterNode(fileNamed: "Pollution") ?? SKEmitterNode()
        
        self.addChild(emitter)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PollutionNode: Interactable {
    func startInteraction() {
        playerDelegate?.changePlayerMovementSpeed(by: 0.1)
        pollenDelegate?.decreasePollen(50.0)
    }
    
    func endInteraction() {
        playerDelegate?.resetPlayerMovementSpeed()
    }
}
