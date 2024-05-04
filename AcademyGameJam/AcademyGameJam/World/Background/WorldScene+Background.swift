//
//  WorldScene+Background.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation

extension WorldScene {
    internal func setupBackground(center: CGPoint) {
        let grid = GridNode(tileSize: .init(width: 25, height: 25), gridSize: (width: 200, height: 200))
        grid.position = .init(x: center.x - grid.width/2, y: center.y - grid.height/2)
        
        addChild(grid)
    }
}
