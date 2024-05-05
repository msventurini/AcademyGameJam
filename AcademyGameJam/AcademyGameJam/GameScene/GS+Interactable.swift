//
//  GS+Interactable.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func enableInteraction(with node: SKNode, highlightSize: CGSize) {
        guard interactable == nil else { return }
        
        interactable = node
        // TODO: Enable the interaction button
        
        let radius = highlightSize.width < highlightSize.height ? highlightSize.width : highlightSize.height
        let stroke = SKShapeNode(circleOfRadius: radius)
        
        stroke.strokeColor = .tintColor
        stroke.lineWidth = 0.2
        stroke.name = "outline"
        stroke.zPosition = node.zPosition + 1
        
        stroke.setScale(0)
        
        stroke.run(.sequence([
            .scale(to: 1, duration: 0.25)
        ]))
        
        node.addChild(stroke)
    }
    
    internal func disableInteraction(of node: SKNode) {
        interactable = nil
        node.childNode(withName: "outline")?.removeFromParent()
        // TODO: Disable the interaction button
    }
}
