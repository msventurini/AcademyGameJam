//
//  TreeNode.swift
//  AcademyGameJam
//
//  Created by Leandro Silva on 04/05/24.
//

import Foundation
import SpriteKit

class TreeNode: SKSpriteNode {
    init(size: CGSize) {
        super.init(texture: Textures.flower, color: .clear, size: size)
        
        self.name = "Tree"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
