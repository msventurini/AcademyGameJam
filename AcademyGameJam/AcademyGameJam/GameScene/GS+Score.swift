//
//  GS+Score.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

extension GameScene {
    internal func increaseScore(by percentage: Float) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            score += settings.score.basePoints - (settings.score.basePoints * percentage)
        }
    }
}
