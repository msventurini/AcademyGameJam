//
//  GS+Score.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

extension GameScene {
    internal func increaseScore(by percentage: Float) {
        score += settings.score.basePoints - (settings.score.basePoints * percentage)
    }
}
