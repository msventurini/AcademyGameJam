//
//  TileNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import SpriteKit

extension MapNode {
    class TileNode: SKSpriteNode {
        private let maxSmallFlowers: Int = .random(in: 0..<5)
        private var smallFlowersSpawned: Int = 0
        
        private let colorGoal = Tokens.Colors.green
        
        public let maxPollen: Float
        public private(set) var pollen: Float = 0
        
        let coordinate: CGPoint
        
        init(coordinate: CGPoint, size: CGSize, pollenRange: Range<Float>) {
            self.maxPollen = .random(in: pollenRange)
            self.coordinate = coordinate
            
            super.init(texture: Textures.backgroundTile, color: .clear, size: size)
            
            self.zPosition = -1
            self.anchorPoint = .zero
            self.colorBlendFactor = 1.0
            self.color = Tokens.Colors.yellow
            
            self.name = NodeName.map.rawValue
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func polinate(_ quantity: Float) -> Bool {
            if pollen >= maxPollen { return false }
            
            pollen += quantity
            color = color.interpolate(to: colorGoal, progress: CGFloat(pollen/maxPollen))
            
            return true
        }
        
        func canSpawnSmallFlower() -> Bool {
            if smallFlowersSpawned >= maxSmallFlowers { return false }
            
            smallFlowersSpawned += 1
            
            return true
        }
    }
}
