//
//  GS+Pollution.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 05/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func addPollution() {
        let pollution = PollutionNode(position: CGPoint(x: custom_bounds.maxX - 700, y: custom_bounds.maxY - 700))
        pollution.pollenDelegate = self
        pollution.playerDelegate = self
        
        self.enemies[.pollution] = [pollution]
        
        self.addChild(pollution)
    }
}
