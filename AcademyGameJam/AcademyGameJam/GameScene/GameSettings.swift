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
        let pointMultiplier: Float
    }
    
    struct Tree {
        let quantity = 4
        let size: CGSize
    }
    
    struct Player {
        let movementSpeed: CGFloat
        let pollenDisperseRate: Float
    }
}
