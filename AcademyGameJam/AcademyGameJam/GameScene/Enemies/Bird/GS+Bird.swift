//
//  GS+Bird.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func spawnBird() {
        guard let player, let view else { return }
        
        let bird = BirdNode(settings: settings.bird, player: player)
        
        let right = Bool.random() ? 1.0 : -1.0
        let up = Bool.random() ? 1.0 : -1.0
        
        let x1 = player.position.x + (view.bounds.width * 2 * right)
        let x2 = player.position.x + (view.bounds.width/2 * right)
        
        let y1 = player.position.y + (view.bounds.height * 2 * up)
        let y2 = player.position.y + (view.bounds.height/2 * up)
        
        let x = CGFloat.random(in: (x1>x2 ? x2 : x1) ..< (x1>x2 ? x1 : x2))
        let y = CGFloat.random(in: (y1>y2 ? y2 : y1) ..< (y1>y2 ? y1 : y2))
        
        bird.position.x = x
        bird.position.y = y
        
        self.addChild(bird)
        
        bird.moveToPlayer()
    }
}
