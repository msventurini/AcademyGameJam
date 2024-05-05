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
        
        //        if contactMask == (PhysicsCategory1) | (PhysicsCategory2) {
        //
        //            guard let node1 = bodyA.node as? SKSpriteNode else { return }
        //            guard let node2 = bodyB.node as? SKSpriteNode else { return }
        //
        //        }
        
        if contactMask == (PhysicsCategory.interactable | PhysicsCategory.player) {
            guard let flower = (bodyA.node as? FlowerNode) ?? (bodyB.node as? FlowerNode) else { return }
            enableInteraction(with: flower, highlightSize: flower.size)
        }
    }
    
    
    
    func didEnd(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        let contactMask = bodyA.categoryBitMask | bodyB.categoryBitMask
        
        if contactMask == (PhysicsCategory.interactable | PhysicsCategory.player) {
            guard let flower = (bodyA.node as? FlowerNode) ?? (bodyB.node as? FlowerNode) else { return }
            disableInteraction(of: flower)
        }
    }
}
