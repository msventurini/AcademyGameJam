//
//  GS+Player.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 08/05/24.
//

import Foundation

extension GameScene: PlayerDelegate {
    internal func changePlayerMovementSpeed(by multiplier: CGFloat) {
        player?.movementSpeed *= multiplier
    }
    
    internal func resetPlayerMovementSpeed() {
        player?.movementSpeed = settings.player.movementSpeed
    }
}
