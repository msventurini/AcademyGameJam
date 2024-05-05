//
//  WorldScene+Flower.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func setupFlowers() {
        let range = (x: settings.flower.size.width/2  + bounds.minX..<bounds.maxX - settings.flower.size.width/2,
                     y: settings.flower.size.height/2 + bounds.minY..<bounds.maxY - settings.flower.size.height/2)
        
        var instantiatedFlowers = [SKNode]()
        let initialPosition = CGPoint(x: bounds.maxX * 1.5, y: bounds.maxY * 1.5)
        for _ in 0..<settings.flower.quantity {
            let flower = FlowerNode(size: settings.flower.size, pointsMultiplier: settings.flower.pointMultiplier)
            flower.position = initialPosition
            
            self.addChild(flower)
            instantiatedFlowers.append(flower)
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            var positionatedFlowers = [SKNode]()
            
            for flower in instantiatedFlowers {
                var point: CGPoint
                repeat {
                    point = CGPoint(
                        x: CGFloat.random(in: range.x),
                        y: CGFloat.random(in: range.y)
                    )
                    
                    flower.position = point
                    
                    if positionatedFlowers.allSatisfy({ !$0.intersects(flower) }) {
                        positionatedFlowers.append(flower)
                        break
                    }
                }
                while true
            }
        }
    }
}
