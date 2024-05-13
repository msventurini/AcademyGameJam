//
//  MyPlayer.swift
//  gstv.world
//
//  Created by Gustavo Diefenbach on 07/09/23.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    weak var pollenDelegate: (any PollenDelegate)?
    
    var movementSpeed: CGFloat // Velocidade de movimento do jogador

    var pollenEmitter: SKEmitterNode
    
    var direction: AnimationDirection = .south
    
    init(movementSpeed: CGFloat, pollenEmitter: SKEmitterNode) {
        let playerSize = CGSize(width: 32, height: 32)
        let defaultTexture = SKTexture(image: .playerSouthTexture0)
        
        self.movementSpeed = movementSpeed
        self.pollenEmitter = pollenEmitter
        
        super.init(texture: defaultTexture, color: .clear, size: playerSize)
        
        self.name = "player"
        
        let pb = SKPhysicsBody(circleOfRadius: playerSize.width / 2)
        
        pb.isDynamic = true
        pb.affectedByGravity = false
        pb.mass = 0.1
        pb.friction = 1.0
        pb.allowsRotation = false

        pb.categoryBitMask = PhysicsCategory.player
        pb.contactTestBitMask = PhysicsCategory.interactable + PhysicsCategory.enemy
        pb.collisionBitMask = PhysicsCategory.player

        self.physicsBody = pb
        
        self.addChild(pollenEmitter)
        
        self.zPosition = Layers.Player
        
        self.name = "Player"
        
        runMovementAnimation(direction: direction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(x: CGFloat, y: CGFloat) {
        let movementAction = SKAction.customAction(withDuration: 1.0) { node, elapsedTime in
            if let node = node as? SKSpriteNode {
                node.position.x += x * self.movementSpeed
                node.position.y += y * self.movementSpeed
                
                
                node.physicsBody?.velocity = CGVector(dx: x * 100, dy: y * 100)
                
                if (x != 0 || y != 0) && elapsedTime.truncatingRemainder(dividingBy: 10) == 0 {
                    self.pollenDelegate?.dispersePollen(at: node.position)
                }
            }
        }
        
        let movementConstantAnimation = SKAction.repeatForever(movementAction)
        
        if x < 0 && y < 0 {
            
            if abs(x - y) < 0.25 {
                runMovementAnimation(direction: .southWest)
                direction = .southWest
            } else if abs(x) > abs(y) {
                runMovementAnimation(direction: .west)
                direction = .west
            } else {
                runMovementAnimation(direction: .south)
                direction = .south
            }
            
            
        } else if x < 0 && y > 0 {
            
            if abs(abs(x) - y) < 0.25 {
                runMovementAnimation(direction: .northWest)
                direction = .northWest
            } else if abs(x) > abs(y) {
                runMovementAnimation(direction: .west)
                direction = .west
            } else {
                runMovementAnimation(direction: .north)
                direction = .north
            }
            
        } else if x > 0 && y < 0 {
            
            if abs((x) - abs(y)) < 0.25 {
                runMovementAnimation(direction: .southEast)
                direction = .southEast
            } else if abs(x) > abs(y) {
                runMovementAnimation(direction: .east)
                direction = .east
            } else {
                runMovementAnimation(direction: .south)
                direction = .south
            }
            
        } else if x > 0 && y > 0 {
            if abs(x - y) < 0.25 {
                runMovementAnimation(direction: .northEast)
                direction = .northEast
            } else if x > y {
                runMovementAnimation(direction: .east)
                direction = .east
            } else {
                runMovementAnimation(direction: .north)
                direction = .north
            }
        } else {
            runMovementAnimation(direction: .south)
            direction = .south
        }
        
        run(movementConstantAnimation, withKey: "walk")
      }
    
    func cancelMovement() {
        if action(forKey: "walk") != nil {
            removeAction(forKey: "walk")
        }
    }
}

