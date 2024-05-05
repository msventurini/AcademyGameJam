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
        
        let pb = SKPhysicsBody(circleOfRadius: 10)
        
        pb.isDynamic = true
        pb.affectedByGravity = false
        pb.mass = 0.1
        pb.friction = 1.0
        
        self.physicsBody = pb
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(x: CGFloat, y: CGFloat) {
        
        let playerMovementAction = SKAction.customAction(withDuration: 0.1) { node, eleapsedTime in
            
//            if let playerNode = self.player {
            
            if let node = node as? SKSpriteNode {
                
                
                node.physicsBody?.velocity = CGVector(dx: x * 1000, dy: y * 1000)
                
                
//                node.position.x += x * 10
//                node.position.y += y * 10
                
            }
            
//                let currentXSpeed = self.movementSpeed * direction.dx
//                let currentYSpeed = self.movementSpeed * direction.dy
//                
//                playerNode.move(x: T##CGFloat, y: T##CGFloat)
                
                //                let playerMovementAction = SKAction.move(by: direction, duration: 0.1)
                //                print(direction)
                //                let runningRigthConstantAnimation = SKAction.repeatForever(playerMovementAction)
                //                playerNode.run(runningRigthConstantAnimation, withKey: "playerWalk")
                
//            }
        }
        
        let movementConstantAnimation = SKAction.repeatForever(playerMovementAction)

        
        run(movementConstantAnimation, withKey: "walk")

        
        
          // Move player based on controller input
//          self.position.x += x * movementSpeed // Multiplica a entrada pelo movimentoSpeed
//          self.position.y += y * movementSpeed // Multiplica a entrada pelo movimentoSpeed
        
        
        
        
        
      }
}
