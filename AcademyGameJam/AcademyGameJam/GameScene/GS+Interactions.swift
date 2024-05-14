//
//  GS+Interactable.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func enableInteraction(with node: SKNode, selectorSize: CGSize) {
        if let interactable = node as? Interactable, !interactable.interactionEnabled { return }
        
        interactables.append(node)
        addSelector(to: node, size: selectorSize)
    }
    
    internal func disableInteraction(of node: SKNode) {
        interactables.removeAll(where: { $0 == node })
        removeSelector(from: node)
        removeProgressBar(from: node)
        isInteracting = false
        if let interactable = node as? Interactable {
            interactable.endInteraction()
        }
    }
    
    internal func cancelInteraction() {
        guard isInteracting, let node = interactables.first else { return }
        disableInteraction(of: node)
    }
    
    internal func interact() {
        guard let node = interactables.first,
              let interactable = node as? Interactable else { return }
        
        interactable.prepareInteraction()
        
        if interactable.hasProgressionBar {
            addProgressBar(to: node)
        } else if interactable.interactionEnabled {
            interactable.startInteraction()
            interactables.remove(at: 0)
        }
        
        isInteracting = true
    }
}


extension GameScene {
    fileprivate func addSelector(to node: SKNode, size: CGSize) {
        let radius = size.width < size.height ? size.width : size.height
        let stroke = SKShapeNode(circleOfRadius: radius)
        
        // TODO: Use a color defined on the `Tokens` struct
        stroke.strokeColor = .tintColor
        stroke.lineWidth = 2
        stroke.name = NodeName.interactableHighlight.rawValue
        stroke.zPosition = node.zPosition + 1
        
        stroke.setScale(0)
        stroke.run(.sequence([
            .scale(to: 1, duration: 0.25)
        ]))
        
        node.addChild(stroke)
    }
    
    fileprivate func removeSelector(from node: SKNode) {
        node.childNode(withName: NodeName.interactableHighlight.rawValue)?
            .run(.sequence([
                .scale(to: 0, duration: 0.15),
                .removeFromParent()
            ]))
    }
    
    fileprivate func addProgressBar(to node: SKNode) {
        let size: CGSize
        if let sizeable = node as? Sizeable {
            size = sizeable.size
        } else {
            size = node.frame.size
        }
        
        let progressBar = ProgressBarNode(size: .init(width: size.width * 2, height: settings.map.tileSize.height/3))

        progressBar.position.y = progressBar.position.y - progressBar.size.height - size.height * 0.5
        node.addChild(progressBar)
        
        // TODO: Increase duration in relation to flower size (HOW THE FUCK DO I DO THIS????)
        progressBar.innerBar?.run(
            .sequence([
                .scaleX(to: 1, duration: 1),
                .group([
                    .run {
                        if let interactable = node as? Interactable {
                            interactable.startInteraction()
                        }
                        
                        self.disableInteraction(of: node)
                        
                        if let button = self.virtualController?.controller?.extendedGamepad?.buttonA,
                           button.isPressed {
                            self.interact()
                        }
                    },
                    .run {
                        progressBar.run(.scale(to: 0, duration: 0.15))
                    }
                ]),
                .run {
                    self.disableInteraction(of: node)
                }
            ]))
    }
    
    fileprivate func removeProgressBar(from node: SKNode) {
        guard let progressBar = node.childNode(withName: NodeName.progressBar.rawValue) else { return }
        
        progressBar.run(.sequence([
            .scale(to: 0, duration: 0.25),
            .removeFromParent()
        ]))
    }
}
