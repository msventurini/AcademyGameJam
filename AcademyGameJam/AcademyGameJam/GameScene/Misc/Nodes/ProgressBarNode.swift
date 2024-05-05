//
//  ProgressBarNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import SpriteKit

class ProgressBarNode: SKSpriteNode {
    var innerBar: SKNode?
    
    init(size: CGSize) {
        super.init(texture: nil, color: .clear, size: size)
        
        let outerBar = SKShapeNode(rectOf: size)
        outerBar.lineWidth = 5
        outerBar.strokeColor = .black
        addChild(outerBar)
        
        let innerBar = SKSpriteNode(color: .green, size: size)
        innerBar.anchorPoint = .init(x: 0, y: 0.5)
        innerBar.position.x -= size.width/2
        innerBar.setScale(0)
        
        innerBar.run(.scaleY(to: 1, duration: 0.01))
        
        outerBar.addChild(innerBar)
        
        self.innerBar = innerBar
        
        self.name = "ProgressBar"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
