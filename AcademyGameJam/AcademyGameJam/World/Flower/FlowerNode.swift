//
//  FlowerNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

class FlowerNode: SKNode {
    public let size: CGSize
    
    init(size: CGSize) {
        self.size = size
        
        super.init()
        
        let sprite = SKSpriteNode(texture: Textures.flower, size: size)
        sprite.name = "Flower"
        
        addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
