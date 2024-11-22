//
//  WorldScene+Background.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation

extension GameScene {
    internal func setupMap() {
        let grid = MapNode(settings: settings.map)
        
        custom_bounds = .init(origin: .zero, size: .init(width: grid.width, height: grid.height))
        
        self.map = grid
        self.addChild(grid)
    }
    
    internal func mapTile(at coordinate: CGPoint) -> MapNode.TileNode? {
        guard let map else { return nil }
        
        return map.tiles[coordinate]
    }
}
