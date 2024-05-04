//
//  WS+ContactDelegate.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation
import SpriteKit

extension WorldScene {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
//        if contactMask == (PhysicsCategory1) | (PhysicsCategory2) {
//            
//            guard let node1 = bodyA.node as? SKSpriteNode else { return }
//            guard let node2 = bodyB.node as? SKSpriteNode else { return }
//
//        }
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
}
