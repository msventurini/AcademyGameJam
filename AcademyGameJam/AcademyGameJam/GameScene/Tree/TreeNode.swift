//
//  TreeNode.swift
//  AcademyGameJam
//
//  Created by Leandro Silva on 04/05/24.
//

import Foundation
import SpriteKit

class TreeNode: SKSpriteNode {
    var interactionEnabled: Bool = false
    weak var pollenDelegate: (any PollenDelegate)?
    
    init(size: CGSize) {
        super.init(texture: Textures.flower, color: .clear, size: size)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.isDynamic = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.interactable
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.interactable
        
        self.zPosition = Layers.Interactable
        
        self.name = "Tree"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TreeNode: Interactable {
    func startInteraction() {
        self.interactionEnabled = false
        pollenDelegate?.increasePollen(300)
    }
}
