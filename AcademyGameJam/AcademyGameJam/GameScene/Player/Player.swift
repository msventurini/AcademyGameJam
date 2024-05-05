//
//  MyPlayer.swift
//  gstv.world
//
//  Created by Gustavo Diefenbach on 07/09/23.
//

import Foundation
import SpriteKit


enum PlayerAnimationDirection {
    case south
}

class Player: SKSpriteNode {
    // TODO: Why?   V
    var moveTimer: Timer? // Temporizador para controlar o movimento contínuo
    
    var playerDirection: CGVector = CGVector(dx: 0, dy: 0)
    var movementSpeed: CGFloat // Velocidade de movimento do jogador
    
    init(movementSpeed: CGFloat) {
        let playerSize = CGSize(width: 32, height: 32)
        let playerColor = UIColor.yellow
        
        self.movementSpeed = movementSpeed
        
        let defaultTexture = SKTexture(image: .playerSouthTexture0)
        
        super.init(texture: defaultTexture, color: .clear, size: playerSize)
        
        
        self.name = "player"
        
        self.physicsBody = SKPhysicsBody(rectangleOf: playerSize)
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.player
        self.physicsBody?.contactTestBitMask = PhysicsCategory.interactable
        self.physicsBody?.collisionBitMask = PhysicsCategory.player
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
    
    func movementAnimation() {
        
        let animation = SKAction.animate(with: [.init(image: .playerSouthTexture0), .init(image: .playerSouthTexture1)], timePerFrame: 0.25)
        
        
    }
    
    func movementCancel() {
        if action(forKey: "walk") != nil {
            removeAction(forKey: "walk")
        }
    }
}
