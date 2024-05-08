//
//  WS+ContactDelegate.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        let contactMask = bodyA.categoryBitMask | bodyB.categoryBitMask
        
        guard let interactable = (bodyA.node as? Interactable) ?? (bodyB.node as? Interactable) else { return }
        
        if contactMask == (PhysicsCategory.interactable | PhysicsCategory.player) {
            guard let node = (interactable as? SKNode) else { return }
            
            let size: CGSize
            if let sizeable = node as? Sizeable {
                size = sizeable.size
            } else {
                size = node.frame.size
            }
            
            enableInteraction(with: node, selectorSize: size)
        }
        
        if contactMask == (PhysicsCategory.enemy | PhysicsCategory.player) {
            interactable.startInteraction()
        }
    }
    
    
    
    func didEnd(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        let contactMask = bodyA.categoryBitMask | bodyB.categoryBitMask
        
        guard let interactable = (bodyA.node as? Interactable) ?? (bodyB.node as? Interactable),
              let node = (interactable as? SKNode) else { return }
        
        disableInteraction(of: node)
        interactable.endInteraction()
    }
}
