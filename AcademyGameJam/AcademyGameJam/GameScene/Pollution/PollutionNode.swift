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
    
    weak var player: Player?
    weak var pollenDelegate: (any PollenDelegate)?
    
    init(position: CGPoint) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 500, height: 500))
        
        self.colorBlendFactor = 1.0
        self.position = position
        
        let pb = SKPhysicsBody(circleOfRadius: self.size.width / 2)
        
        pb.isDynamic = true
        
        pb.categoryBitMask = PhysicsCategory.pollution
        pb.contactTestBitMask = PhysicsCategory.player
        pb.collisionBitMask = PhysicsCategory.pollution
        
        self.physicsBody = pb
        
        let emitter = SKEmitterNode(fileNamed: "Pollution") ?? SKEmitterNode()
        
        self.addChild(emitter)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func applyForce(towards targetPoint: CGPoint, withMagnitude magnitude: CGFloat) {
        let vector = self.position.vector(to: targetPoint)
        
        let length = sqrt(vector.dx * vector.dx + vector.dy * vector.dy)
        let normalizedVector = CGVector(dx: vector.dx / length, dy: vector.dy / length)
        
        let force = CGVector(dx: normalizedVector.dx * magnitude, dy: normalizedVector.dy * magnitude)
        
        self.physicsBody?.applyForce(force)
    }
}

extension PollutionNode: Interactable {
    func startInteraction() {
        guard let player else { return }
        
        self.player?.movementSpeed = 0.5
        pollenDelegate?.decreasePollen(50.0)
    }
    
    func endInteraction() {
        self.player?.movementSpeed = 5
    }
}
