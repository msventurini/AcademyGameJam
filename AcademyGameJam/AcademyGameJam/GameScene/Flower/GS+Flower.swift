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
        
        let initialPosition = CGPoint(x: bounds.maxX * 1.5, y: bounds.maxY * 1.5)
        
        var instantiatedFlowers = [SKNode]()
        for _ in 0..<settings.flower.quantity {
            let flower = FlowerNode(size: settings.flower.size, pollenMultiplier: settings.flower.pollenMultiplier)
            flower.pollenDelegate = self
            flower.position = initialPosition
            
            self.addChild(flower)
            instantiatedFlowers.append(flower)
        }
        
        var positionatedFlowers = children.filter({ $0.name == NodeName.flower.rawValue || $0.name == NodeName.tree.rawValue })
        
        DispatchQueue.global().async {
            for flower in instantiatedFlowers {
                var attempt: Int = 0
                
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
                    
                    if attempt == 5 { break }
                    
                    attempt += 1
                }
                while true
            }
        }
    }
}
