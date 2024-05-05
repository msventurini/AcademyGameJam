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
        if interactable == node {
            interactable = nil
        }
        
        node.childNode(withName: "outline")?.run(.scale(to: 0, duration: 0.15)) {
            node.childNode(withName: "outline")?.removeFromParent()
        }
        
        // TODO: Disable the interaction button
    }
    
    internal func interact() {
        guard let interactable else { return }
        
        if let interactableNode = interactable as? InteractableNode, !interactableNode.hasBeenInteracted {
            addProgressBar(to: interactable)
        }
    }
    
    internal func cancelInteraction() {
        guard let interactable else { return }
        
        if let progressBar = interactable.childNode(withName: "ProgressBar") {
            progressBar.removeFromParent()
        }
    }
    
    private func addProgressBar(to node: SKNode) {
        let size: CGSize
        if let sizeable = node as? Sizeable {
            size = sizeable.size
        } else {
            size = node.frame.size
        }
        
        let progressBar = ProgressBarNode(size: .init(width: size.width * 2, height: settings.map.tileSize.height/3))
        
        progressBar.zPosition = node.zPosition + 1
        progressBar.position.y = progressBar.position.y - progressBar.size.height - size.height * 0.5
        node.addChild(progressBar)
        
        // TODO: Increase duration in relation to flower size (HOW THE FUCK DO I DO THIS????)
        progressBar.innerBar?.run(
            .sequence([
                .scaleX(to: 1, duration: 1),
                .group([
                    .run {
                        if var interactable = node as? InteractableNode {
                            interactable.hasBeenInteracted = true
                        }
                        
                        if let pointGiver = node as? PointGiver {
                            self.score += pointGiver.points
                        }
                        
                        self.disableInteraction(of: node)
                    },
                    .run {
                        progressBar.run(.scale(to: 0, duration: 0.15))
                    }
                ]),
                .run {
                    progressBar.removeFromParent()
                }
            ]))
    }
}
