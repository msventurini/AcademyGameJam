//
//  GS+AddBoundaries.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 05/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    internal func addBoundaries() {
        
        let topBoundary = SKSpriteNode(color: UIColor.clear, size: CGSize(width: bounds.width, height: 10))
        topBoundary.position = CGPoint(x: bounds.midX, y: bounds.maxY)
        
        let toppb = SKPhysicsBody(rectangleOf: topBoundary.size)
        toppb.isDynamic = false
        topBoundary.physicsBody = toppb
        
        let bottomBoundary = SKSpriteNode(color: UIColor.clear, size: CGSize(width: bounds.width, height: 10))
        bottomBoundary.position = CGPoint(x: bounds.midX, y: bounds.minY)
        
        let bottompb = SKPhysicsBody(rectangleOf: bottomBoundary.size)
        bottompb.isDynamic = false
        bottomBoundary.physicsBody = bottompb
        
        let leftBoundary = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 10, height: bounds.height))
        leftBoundary.position = CGPoint(x: bounds.minX, y: bounds.midY)
        
        let leftpb = SKPhysicsBody(rectangleOf: leftBoundary.size)
        leftpb.isDynamic = false
        leftBoundary.physicsBody = leftpb
        
        let rightBoundary = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 10, height: bounds.height))
        rightBoundary.position = CGPoint(x: bounds.maxX, y: bounds.midY)
        
        let rightpb = SKPhysicsBody(rectangleOf: rightBoundary.size)
        rightpb.isDynamic = false
        rightBoundary.physicsBody = rightpb
        
        self.addChild(topBoundary)
        self.addChild(bottomBoundary)
        self.addChild(leftBoundary)
        self.addChild(rightBoundary)
    }
    
}

