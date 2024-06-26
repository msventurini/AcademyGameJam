//
//  GS+Player.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 08/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func setupPlayer() {
        let player = Player(movementSpeed: settings.player.movementSpeed, pollenEmitter: pollenEmitter)
        player.pollenDelegate = self
        
        player.position = .init(x: (map?.width ?? 0)/2, y: (map?.height ?? 0)/2) // CGPoint(x: size.width / 2, y: size.height / 2)
        
        self.player = player
        addChild(self.player!)
    }
}
