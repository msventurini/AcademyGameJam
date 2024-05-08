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
        let pointA = CGPoint(x: center.x + (bounds.width * 0.25) + CGFloat.random(in: -100...100), y: center.y + (bounds.width * 0.25) + CGFloat.random(in: -100...100))
        let pointB = CGPoint(x: center.x + (bounds.width * 0.25) + CGFloat.random(in: -100...100), y: center.y - (bounds.width * 0.25) + CGFloat.random(in: -100...100))
        let pointC = CGPoint(x: center.x - (bounds.width * 0.25) + CGFloat.random(in: -100...100), y: center.y - (bounds.width * 0.25) + CGFloat.random(in: -100...100))
        let pointD = CGPoint(x: center.x - (bounds.width * 0.25) + CGFloat.random(in: -100...100), y: center.y + (bounds.width * 0.25) + CGFloat.random(in: -100...100))
        
        let points = [pointA, pointB, pointC, pointD]
        for point in points {
            let tree = TreeNode(size: settings.tree.size)
            tree.pollenDelegate = self
            tree.position = point
            
            addChild(tree)
            
            setupFlowersAroundTree(around: point)
        }
    }
    
    func setupFlowersAroundTree(around treePosition: CGPoint) {
        let radiusBonus = CGFloat.random(in: settings.tree.flowerRadiusRandomRange)
        
        for i in 0..<settings.tree.numberOfFlowersAround {
            let angle = CGFloat(i) * (2 * .pi / CGFloat(settings.tree.numberOfFlowersAround))
            
            
            let xOffset = (settings.tree.flowerRadius + radiusBonus) * cos(angle)
            let yOffset = (settings.tree.flowerRadius + radiusBonus) * sin(angle)
            
            let flowerPosition = CGPoint(x: treePosition.x + xOffset, y: treePosition.y + yOffset)
            
            let flower = FlowerNode(size: settings.flower.size, pollenMultiplier: settings.flower.pollenMultiplier)
            
            flower.pollenDelegate = self
            flower.position = flowerPosition
            
            addChild(flower)
        }
    }
}
