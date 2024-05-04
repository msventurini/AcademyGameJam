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
        
        for _ in 0..<settings.flower.quantity {
            let flower = FlowerNode(size: settings.flower.size)
            
            var point: CGPoint = .zero
            
            while true {
                let x = CGFloat.random(in: range.x)
                let y = CGFloat.random(in: range.y)
                
                point = CGPoint(x: x, y: y)
                let nodes = self.nodes(at: point)
                
                if !nodes.contains(where: { $0.name == "Flower" }) { break }
            }
            
            flower.position = point
            addChild(flower)
        }
    }
}
