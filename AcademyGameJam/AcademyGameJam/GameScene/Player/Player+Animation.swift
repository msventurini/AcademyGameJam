//
//  Player+Animation.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 08/05/24.
//

import Foundation
import SpriteKit


extension Player {
    enum AnimationDirection {
        case north, south, east, west, northWest, northEast, southWest, southEast
        
        func textures() -> [SKTexture] {
            switch self {
            case .north:
                return [.init(image: .playerNorthTexture0), .init(image: .playerNorthTexture1)]
            case .south:
                return [.init(image: .playerSouthTexture0), .init(image: .playerSouthTexture1)]
            case .east:
                return [.init(image: .playerEastTexture0), .init(image: .playerEastTexture1)]
            case .west:
                return [.init(image: .playerWestTexture0), .init(image: .playerWestTexture1)]
            case .northWest:
                return [.init(image: .playerNorthWestTexture0), .init(image: .playerNorthWestTexture1)]
            case .northEast:
                return [.init(image: .playerNorthEastTexture0), .init(image: .playerNorthEastTexture1)]
            case .southWest:
                return [.init(image: .playerSouthWestTexture0), .init(image: .playerSouthWestTexture1)]
            case .southEast:
                return [.init(image: .playerSouthEastTexture0), .init(image: .playerSouthEastTexture1)]
            }
        }
    }
    
    internal func runMovementAnimation(direction: AnimationDirection) {
        let animation = SKAction.animate(with: direction.textures(), timePerFrame: 0.15)
        let movementAnimation = SKAction.repeatForever(animation)
        
        run(movementAnimation)
    }
}
