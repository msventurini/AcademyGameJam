//
//  GS+Flow.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 07/05/24.
//

import Foundation

extension GameScene {
    internal func togglePause() {
        isPaused.toggle()
        if isPaused {
            virtualController = nil
        } else {
            setupVirtualController()
        }
    }
    
    internal func endGame() {
        cancelUpdaters()
        player?.movementCancel()
        virtualController = nil
        
        Task {
            await GameCenterUtility.sendLeaderboard(score: Int(score))
        }
        
        isGameOver = true
    }
}
