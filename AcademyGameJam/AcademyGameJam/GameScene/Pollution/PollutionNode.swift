//
//  PollutionNode.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 05/05/24.
//

import Foundation
import SpriteKit

class PollutionNode: SKSpriteNode {
        
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

extension CGPoint {
    public func distanceFromCGPoint(_ point: CGPoint) -> CGFloat {
        return sqrt(pow(self.x - point.x,2) + pow(self.y - point.y,2))
    }
    public func vector(to point: CGPoint) -> CGVector {
        return CGVector(dx: point.x - self.x, dy: point.y - self.y)
    }
    public func normalized() -> CGVector {
        let length = sqrt(x * x + y * y)
        return CGVector(dx: x / length, dy: y / length)
    }
}
