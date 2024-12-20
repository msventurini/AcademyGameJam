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
    
    lazy private var dirtEmitter: SKEmitterNode = {
        let emitter = SKEmitterNode(fileNamed: "Dirt") ?? SKEmitterNode()
        emitter.name = NodeName.dirt.rawValue
        emitter.alpha = 0
        emitter.setScale(0)
        emitter.zPosition = Layers.Particles
        
        return emitter
    }()
    
    let variation: Int
    
    init(size: CGSize, pollenMultiplier: Float, isInteractable: Bool = true) {
        let multiplier = CGFloat.random(in: 0.5...1.0)
        let trueSize = CGSize.init(width: size.width * multiplier, height: size.height * multiplier)
        
        self.pollen = Float(trueSize.width + trueSize.height)/2 * pollenMultiplier
        self.variation = Int.random(in: 0...1)
        
        self.interactionEnabled = isInteractable
        
        let texture: SKTexture
        switch (variation, interactionEnabled) {
        case (0, true):
            texture = Textures.flower1_down
        case (0, false):
            texture = Textures.flower1_normal
        case (1, true):
            texture = Textures.flower2_down
        case (1, false):
            texture = Textures.flower2_normal
        default:
            texture = Textures.flower1_normal
        }
        
        super.init(texture: texture, color: .clear, size: trueSize)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: trueSize)
        self.physicsBody?.isDynamic = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.interactable
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.interactable
        
        self.zPosition = Layers.Interactable
        
        self.name = NodeName.flower.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FlowerNode: Interactable {
    func prepareInteraction() {
        dirtEmitter.run(.group([
            .fadeAlpha(to: 1, duration: 0.15),
            .scale(to: 1, duration: 0.15)
        ]))
        
        self.addChild(dirtEmitter)
    }
    
    func startInteraction() {
        self.interactionEnabled = false
        pollenDelegate?.increasePollen(pollen)
        self.texture = variation == 0 ? Textures.flower1_normal : Textures.flower2_normal
    }
    
    func endInteraction() {
        dirtEmitter.run(.sequence([
            .group([
                .fadeOut(withDuration: 0.25),
                .scaleY(to: 0, duration: 0.3)
            ]),
            .removeFromParent()
        ]))
    }
}
