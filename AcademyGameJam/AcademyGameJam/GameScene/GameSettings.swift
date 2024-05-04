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
    
    struct Map {
        let width: Int
        let height: Int
        let tileSize: CGSize
        
        init(map: Int, tile: Double) {
            self.width = map
            self.height = map
            self.tileSize = .init(width: tile, height: tile)
        }
    }
    
    struct Flower {
        let quantity: Int
        let size: CGSize
    }
}
