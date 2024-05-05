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
    
    weak var pollenDelegate: (any PollenDelegate)?
    
    var playerDirection: CGVector = CGVector(dx: 0, dy: 0)
    var movementSpeed: CGFloat // Velocidade de movimento do jogador
    
    init(movementSpeed: CGFloat) {
        let playerSize = CGSize(width: 32, height: 32)
        let playerColor = UIColor.yellow
        self.movementSpeed = movementSpeed
        
        let defaultTexture = SKTexture(image: .playerSouthTexture0)
        
        super.init(texture: defaultTexture, color: .clear, size: playerSize)
        
        
        self.name = "player"
        
        let pb = SKPhysicsBody(circleOfRadius: playerSize.width / 2)
        
        pb.isDynamic = true
        pb.affectedByGravity = false
        pb.mass = 0.1
        pb.friction = 1.0
        pb.allowsRotation = false

        pb.categoryBitMask = PhysicsCategory.player
        pb.contactTestBitMask = PhysicsCategory.interactable
        pb.collisionBitMask = PhysicsCategory.player
        
        self.physicsBody = pb
        
//        movementAnimationSouth()

        //        movementAnimationNorth()
//        movementAnimationWest()
//        movementAnimationEast()
        
        //        movementAnimationSouthWest()
                movementAnimationNorthEast()
//        movementAnimationSouthEast()
//        movementAnimationNorthWest()

        
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
        
        if x < 0 && y < 0 {
            
            if abs(x - y) < 0.25 {
                movementAnimationSouthWest()
            } else if abs(x) > abs(y) {
                movementAnimationWest()
            } else {
                movementAnimationSouth()
            }
            
            
        } else if x < 0 && y > 0 {
            
            if abs(abs(x) - y) < 0.25 {
                movementAnimationNorthWest()
            } else if abs(x) > abs(y) {
                movementAnimationWest()
            } else {
                movementAnimationNorth()
            }
            
        } else if x > 0 && y < 0 {
            
            if abs((x) - abs(y)) < 0.25 {
                movementAnimationSouthEast()
            } else if abs(x) > abs(y) {
                movementAnimationEast()
            } else {
                movementAnimationSouth()
            }
            
        } else if x > 0 && y > 0 {
            if abs(x - y) < 0.25 {
                movementAnimationNorthEast()
            } else if x > y {
                movementAnimationEast()
            } else {
                movementAnimationNorth()
            }
        } else {
            movementAnimationSouth()
        }
            
        
        
        print(y.description)
        
        
        run(movementConstantAnimation, withKey: "walk")
      }
    
    func movementAnimationNorth() {
        
        let animation = SKAction.animate(with: [.init(image: .playerNorthTexture0), .init(image: .playerNorthTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    func movementAnimationSouth() {
        
        let animation = SKAction.animate(with: [.init(image: .playerSouthTexture0), .init(image: .playerSouthTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    func movementAnimationEast() {
        
        let animation = SKAction.animate(with: [.init(image: .playerEastTexture0), .init(image: .playerEastTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    func movementAnimationWest() {
        
        let animation = SKAction.animate(with: [.init(image: .playerWestTexture0), .init(image: .playerWestTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    
    func movementAnimationNorthWest() {
        
        let animation = SKAction.animate(with: [.init(image: .playerNorthWestTexture0), .init(image: .playerNorthWestTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    func movementAnimationNorthEast() {
        
        let animation = SKAction.animate(with: [.init(image: .playerNorthEastTexture0), .init(image: .playerNorthEastTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    func movementAnimationSouthWest() {
        
        let animation = SKAction.animate(with: [.init(image: .playerSouthWestTexture0), .init(image: .playerSouthWestTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    
    func movementAnimationSouthEast() {
        
        let animation = SKAction.animate(with: [.init(image: .playerSouthEastTexture0), .init(image: .playerSouthEastTexture1)], timePerFrame: 0.15)
        
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
        
    }
    

    
    
    

    
    func movementCancel() {
        if action(forKey: "walk") != nil {
            removeAction(forKey: "walk")
        }
    }
}
