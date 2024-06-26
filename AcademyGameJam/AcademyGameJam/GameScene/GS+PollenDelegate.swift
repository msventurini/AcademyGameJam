//
//  GS+PollenDelegate.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import SpriteKit

extension GameScene: PollenDelegate {
    internal func increasePollen(_ quantity: Float) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.pollen += quantity
        }
    }
        
    internal func decreasePollen(_ quantity: Float) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            pollen -= quantity
            if pollen < 0 { pollen = 0 }
        }
    }
    
    internal func dispersePollen(at position: CGPoint) {
        let nodes = nodes(at: position).filter({ $0.name == NodeName.map.rawValue })
        
        DispatchQueue.global(qos: .userInteractive).sync { [weak self] in
            guard let self else { return }
            
            for node in nodes {
                guard let centralTile = node as? MapNode.TileNode else { continue }
                
                let right = mapTile(at: .init(x: centralTile.coordinate.x + 1, y: centralTile.coordinate.y))
                let left = mapTile(at: .init(x: centralTile.coordinate.x - 1, y: centralTile.coordinate.y))
                
                let up = mapTile(at: .init(x: centralTile.coordinate.x, y: centralTile.coordinate.y + 1))
                let down = mapTile(at: .init(x: centralTile.coordinate.x, y: centralTile.coordinate.y - 1))
                
                let neighboringTiles = [centralTile, right, left, up, down].compactMap({ $0 })
                
                for tile in neighboringTiles {
                    if pollen - settings.player.pollenDisperseRate <= 0 { return }
                    
                    if Bool.random() { continue }
                    
                    let polinated = tile.polinate(settings.player.pollenDisperseRate)
                    if polinated {
                        decreasePollen(settings.player.pollenDisperseRate)
                        increaseScore(by: tile.pollen/tile.maxPollen)
                        
                        if tile.pollen/tile.maxPollen >= 0.25 && tile.canSpawnSmallFlower() {
                            let x = tile.position.x + .random(in: 0..<tile.size.width)
                            let y = tile.position.y + .random(in: 0..<tile.size.height)
                            
                            spawnSmallFlower(at: .init(x: x, y: y))
                        }
                    }
                }
                
            }
        }
    }
}
