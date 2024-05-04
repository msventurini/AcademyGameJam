//
//  MyPlayer.swift
//  gstv.world
//
//  Created by Gustavo Diefenbach on 07/09/23.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    var moveTimer: Timer? // Temporizador para controlar o movimento contínuo
    
    var playerDirection: CGVector = CGVector(dx: 0, dy: 0)
    var movementSpeed: CGFloat = 5.0 // Velocidade de movimento do jogador
    
    init() {
        let playerSize = CGSize(width: 10, height: 10)
        let playerColor = UIColor.yellow
        
        super.init(texture: nil, color: playerColor, size: playerSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(x: CGFloat, y: CGFloat) {
        
        let playerMovementAction = SKAction.customAction(withDuration: 1) { node, eleapsedTime in
            if let node = node as? SKSpriteNode {
                
                node.position.x += x * self.movementSpeed
                node.position.y += y * self.movementSpeed
                
            }

        }
        
        let movementConstantAnimation = SKAction.repeatForever(playerMovementAction)

        run(movementConstantAnimation, withKey: "walk")
        
      }
    
    func movementCancel() {
        if action(forKey: "walk") != nil {
            removeAction(forKey: "walk")
        }
    }
    
    
}
