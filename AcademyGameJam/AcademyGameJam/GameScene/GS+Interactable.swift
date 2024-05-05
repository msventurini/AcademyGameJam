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
        
        // TODO: Use a color defined on the `Tokens` struct
        stroke.strokeColor = .tintColor
        stroke.lineWidth = 2
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
    
    internal func interact() {
        guard let interactable else { return }
        
        if let flower = interactable as? FlowerNode, !flower.hasBeenInteracted  {
            let progressBar = ProgressBarNode(size: .init(width: flower.size.width * 2, height: settings.map.tileSize.height/3))
            
            progressBar.zPosition = flower.zPosition + 1
            progressBar.position.y = progressBar.position.y - progressBar.size.height - flower.size.height * 0.5
            flower.addChild(progressBar)
            
            // TODO: Increase duration in relation to flower size (HOW THE FUCK DO I DO THIS????)
            progressBar.innerBar?.run(.scaleX(to: 1, duration: 1)) {
                flower.hasBeenInteracted = true
                self.score += Int(flower.points)
                
                progressBar.removeFromParent()
            }
        }
    }
    
    internal func cancelInteraction() {
        guard let interactable else { return }
        
        if let progressBar = interactable.childNode(withName: "ProgressBar") {
            progressBar.removeFromParent()
        }
    }
}
