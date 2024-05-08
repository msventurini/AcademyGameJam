//
//  BirdNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import SpriteKit

class BirdNode: SKSpriteNode {
    var interactionEnabled: Bool = true
    let hasProgressionBar: Bool = false
    
    let settings: GameSettings.Enemies.Bird
    
    weak var player: Player?
    weak var pollenDelegate: (any PollenDelegate)?
    var circleProgression: CGFloat = 0
    
    init(settings: GameSettings.Enemies.Bird, player: Player) {
        self.settings = settings
        self.player = player
        
        let multiplier = CGFloat.random(in: 0.5...1)
        let size = CGSize(width: settings.size.width * multiplier, height: settings.size.height * multiplier)
        
        super.init(texture: nil, color: .black, size: size)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.enemy
        
        self.zPosition = Layers.Enemy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToPlayer() {
        guard let player else { return }
        
        let x = player.position.x + (settings.approachBeforeAttackRadius * (position.x > player.position.x ? 1 : -1))
        let y = player.position.y + (settings.approachBeforeAttackRadius * (position.y > player.position.y ? 1 : -1))
        
        run(.move(to: .init(x: x, y: y), duration: 2)) { [weak self] in
            guard let self else { return }
            SpriteKitUtility.applyForce(to: self, towards: player.position, withMagnitude: 2000)
        }
    }
}

extension BirdNode: Interactable {
    func startInteraction() {
        guard let player else { return }
        
        pollenDelegate?.decreasePollen(50)
        
        player.run(.move(by: .init(dx: .random(in: -100...100), dy: .random(in: -100...100)), duration: 0.7))
        
        run(.sequence([
            .wait(forDuration: 3),
            .scale(to: 0, duration: 1),
            .removeFromParent()
        ]))
    }
}
