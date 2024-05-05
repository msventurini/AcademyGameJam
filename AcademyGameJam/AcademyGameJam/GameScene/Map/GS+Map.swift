//
//  WorldScene+Background.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation

extension GameScene {
    internal func setupMap(center: CGPoint) {
        let grid = MapNode(settings: settings.map)
        
        let trueCenter = CGPoint(x: center.x - grid.width/2, y: center.y - grid.height/2)
        grid.position = trueCenter
        
        bounds = .init(origin: trueCenter, size: .init(width: grid.width, height: grid.height))
        
        self.map = grid
        self.addChild(grid)
    }
    
    internal func mapTile(at coordinate: CGPoint) -> MapNode.TileNode? {
        guard let map else { return nil }
        
        return map.tiles.first(where: { $0.coordinate == coordinate })
    }
}
