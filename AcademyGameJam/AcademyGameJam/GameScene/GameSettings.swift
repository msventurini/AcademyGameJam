//
//  GameSettings.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation

struct GameSettings {
    let flower: Flower
    let map: Map
    let tree: Tree
    let player: Player
    let score: Score
    let bird: Enemies.Bird
    
    struct Map {
        let width: Int
        let height: Int
        let tileSize: CGSize
        let tilePollenRange: Range<Float>
        
        init(map: Int, tile: Double, tilePollenRange: Range<Float>) {
            self.width = map
            self.height = map
            self.tileSize = .init(width: tile, height: tile)
            self.tilePollenRange = tilePollenRange
        }
    }
    
    struct Flower {
        let quantity: Int
        let size: CGSize
        let pollenMultiplier: Float
    }
    
    struct Tree {
        let size: CGSize
        let numberOfFlowersAround: Int
        let flowerRadius: CGFloat
        let flowerRadiusRandomRange: Range<CGFloat>
    }
    
    struct Player {
        let movementSpeed: CGFloat
        let pollenDisperseRate: Float
    }
    
    struct Score {
        let basePoints: Float
    }
    
    struct Enemies {
        struct Bird {
            let size: CGSize
            let movementSpeed: CGFloat
            let knockbackForce: CGFloat
            let approachBeforeAttackRadius: CGFloat
        }
    }
}
