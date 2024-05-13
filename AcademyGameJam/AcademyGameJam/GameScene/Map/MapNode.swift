//
//  GridNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

class MapNode: SKNode {
    public let width: CGFloat
    public let height: CGFloat
    
    public private(set) var tiles: [CGPoint : TileNode] = [:]

    init(settings: GameSettings.Map) {
        self.width = CGFloat(settings.width) * settings.tileSize.width
        self.height = CGFloat(settings.height) * settings.tileSize.height
        
        super.init()
        
        for column in 0..<settings.width {
            for row in 0..<settings.height {
                let coordinate = CGPoint(x: column, y: row)
                let tile = TileNode(coordinate: coordinate, size: settings.tileSize, pollenRange: settings.tilePollenRange)
                
                tile.position.x = CGFloat(column) * settings.tileSize.width
                tile.position.y = CGFloat(row) * settings.tileSize.height
                
                addChild(tile)
                tiles.updateValue(tile, forKey: coordinate)
            }
        }
        
        self.name = "Map"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
