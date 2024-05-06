//
//  MyPlayer.swift
//  gstv.world
//
//  Created by Gustavo Diefenbach on 07/09/23.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    // TODO: Why?   V
    var moveTimer: Timer? // Temporizador para controlar o movimento contínuo
    
    weak var pollenDelegate: (any PollenDelegate)?
    
    var playerDirection: CGVector = CGVector(dx: 0, dy: 0)
    var movementSpeed: CGFloat // Velocidade de movimento do jogador
    
    init(movementSpeed: CGFloat) {
        let playerSize = CGSize(width: 10, height: 10)
        let playerColor = UIColor.yellow
        self.movementSpeed = movementSpeed
        super.init(texture: nil, color: playerColor, size: playerSize)
        
        let pb = SKPhysicsBody(circleOfRadius: playerSize.width / 2)
        
        pb.isDynamic = true
        pb.affectedByGravity = false
        pb.mass = 0.1
        pb.friction = 1.0
        pb.allowsRotation = false

        pb.categoryBitMask = PhysicsCategory.player
        pb.contactTestBitMask = PhysicsCategory.interactable + PhysicsCategory.pollution
        pb.collisionBitMask = PhysicsCategory.player
        
        self.physicsBody = pb
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(x: CGFloat, y: CGFloat) {
        
        let playerMovementAction = SKAction.customAction(withDuration: 1.0) { node, eleapsedTime in
            
//            if let playerNode = self.player {
            
            if let node = node as? SKSpriteNode {
                node.position.x += x * self.movementSpeed
                node.position.y += y * self.movementSpeed
                
                
                node.physicsBody?.velocity = CGVector(dx: x * 100, dy: y * 100)
                
                if x != 0 || y != 0 {
                    self.pollenDelegate?.dispersePollen(at: node.position)
                }
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
