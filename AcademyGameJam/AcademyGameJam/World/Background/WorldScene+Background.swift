//
//  WorldScene+Background.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation

extension WorldScene {
    internal func setupBackground(center: CGPoint) {
        let grid = BackgroundNode(
            tileSize: settings.map.tileSize,
            gridSize: (width: settings.map.width,
                       height: settings.map.height)
        )
        
        let trueCenter = CGPoint(x: center.x - grid.width/2, y: center.y - grid.height/2)
        grid.position = trueCenter
        
        bounds = .init(origin: trueCenter, size: .init(width: grid.width, height: grid.height))
        
        self.background = grid
        self.addChild(grid)
    }
}
