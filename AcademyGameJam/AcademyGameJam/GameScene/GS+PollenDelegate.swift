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
        DispatchQueue.main.async {
            self.pollen += quantity
        }
    }
        
    internal func decreasePollen(_ quantity: Float) {
        DispatchQueue.main.async {
            self.pollen -= quantity
        }
    }
    
    internal func dispersePollen(at position: CGPoint) {
        let nodes = nodes(at: position).filter({ $0.name == "MapTile" })
        
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let self else { return }
            
            for node in nodes {
                guard let centralTile = node as? MapNode.TileNode else { continue }
                
                let right = mapTile(at: .init(x: centralTile.coordinate.x + 1, y: centralTile.coordinate.y))
                let left = mapTile(at: .init(x: centralTile.coordinate.x - 1, y: centralTile.coordinate.y))
                
                let up = mapTile(at: .init(x: centralTile.coordinate.x, y: centralTile.coordinate.y + 1))
                let down = mapTile(at: .init(x: centralTile.coordinate.x, y: centralTile.coordinate.y - 1))
                
                let upRight = mapTile(at: .init(x: centralTile.coordinate.x + 1, y: centralTile.coordinate.y + 1))
                let upLeft = mapTile(at: .init(x: centralTile.coordinate.x - 1, y: centralTile.coordinate.y + 1))
                
                let downRight = mapTile(at: .init(x: centralTile.coordinate.x + 1, y: centralTile.coordinate.y - 1))
                let downLeft = mapTile(at: .init(x: centralTile.coordinate.x - 1, y: centralTile.coordinate.y - 1))
                
                let neighboringTiles = [centralTile, right, left, up, upRight, upLeft, down, downRight, downLeft].compactMap({ $0 })
                
                for tile in neighboringTiles {
                    if pollen - settings.player.pollenDisperseRate <= 0 { return }
                    if Bool.random() { continue }
                    
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        
                        let polinated = tile.polinate(settings.player.pollenDisperseRate)
                        if polinated {
                            decreasePollen(settings.player.pollenDisperseRate)
                            increaseScore(by: tile.pollen/tile.maxPollen)
                        }
                    }
                }
                
            }
        }
    }
}
