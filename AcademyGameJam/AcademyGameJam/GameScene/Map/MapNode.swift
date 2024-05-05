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
    
    init(tileSize: CGSize, gridSize: (width: Int, height: Int)) {
        self.width = CGFloat(gridSize.width) * tileSize.width
        self.height = CGFloat(gridSize.height) * tileSize.height
        
        super.init()
        
        let baseSprite = SKSpriteNode(texture: Textures.backgroundTile, size: tileSize)
        
        for column in 0..<gridSize.width {
            for row in 0..<gridSize.height {
                let sprite = (baseSprite.copy() as! SKSpriteNode)
                
                sprite.position.x = CGFloat(column) * tileSize.width
                sprite.position.y = CGFloat(row) * tileSize.height
                sprite.zPosition = -1
                sprite.anchorPoint = .zero
                sprite.colorBlendFactor = 1.0
                sprite.color = Tokens.green()
                sprite.name = "MapTile"
                
                addChild(sprite)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}