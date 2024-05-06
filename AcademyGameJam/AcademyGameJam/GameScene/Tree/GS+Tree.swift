//
//  GS+Tree.swift
//  AcademyGameJam
//
//  Created by Leandro Silva on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene{
    internal func setupTrees(center: CGPoint) {
        for i in 0..<settings.tree.quantity {
            let tree = TreeNode(size: settings.tree.size)
            tree.pollenDelegate = self
            
            var point: CGPoint = .zero
            
            // Posicionamento de cada árvore
            switch i {
            case 0:
                point = CGPoint(x: center.x + 1500 + randomNumber(), y: center.y + 1700 + randomNumber())
            case 1:
                point = CGPoint(x: center.x + 1600 + randomNumber(), y: center.y - 1700 + randomNumber())
            case 2:
                point = CGPoint(x: center.x - 1500 + randomNumber(), y: center.y + 1700 + randomNumber())
            case 3:
                point = CGPoint(x: center.x - 1500 + randomNumber(), y: center.y - 1700 + randomNumber())
            default:
                break
            }
            
            if i < 4 {
                tree.position = point
                addChild(tree)
                
                // Adicionar flores ao redor de cada árvore
                setupFlowersAroundTree(around: point)
            }
        }
    }
    // Método para adicionar flores ao redor de uma posição central (árvore)
    func setupFlowersAroundTree(around treePosition: CGPoint) {
        let radius: CGFloat = settings.tree.treeRadius
        for i in 0..<settings.tree.numberOfFlowersAround {
            let angle = CGFloat(i) * (2 * .pi / CGFloat(settings.tree.numberOfFlowersAround))
            let xOffset = radius * cos(angle)
            let yOffset = radius * sin(angle)
            let flowerPosition = CGPoint(x: treePosition.x + xOffset, y: treePosition.y + yOffset)
            
            let flower = FlowerNode(size: settings.flower.size, pollenMultiplier: settings.flower.pollenMultiplier)
            flower.pollenDelegate = self
            flower.position = flowerPosition
            
            addChild(flower)
        }
    }
    
    //gera um numero aletório entre -100 e 100
    func randomNumber() -> CGFloat {
        return CGFloat.random(in: -100...100)
    }
}
