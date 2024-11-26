//
//  Utility.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 07/05/24.
//

import Foundation
import SpriteKit
import GameKit

struct SpriteKitUtility {
    static public func applyForce(to node: SKNode, towards targetPoint: CGPoint, withMagnitude magnitude: CGFloat) {
        let vector = node.position.vector(to: targetPoint)
        
        let length = sqrt(vector.dx * vector.dx + vector.dy * vector.dy)
        let normalizedVector = CGVector(dx: vector.dx / length, dy: vector.dy / length)
        
        let force = CGVector(dx: normalizedVector.dx * magnitude, dy: normalizedVector.dy * magnitude)
        
        node.physicsBody?.applyForce(force)
    }
}

struct GameCenterUtility {
    static public func authenticateUser() {
        DispatchQueue.main.async {
            GKLocalPlayer.local.authenticateHandler = { vc, error in
                guard error == nil else {
                    print(error?.localizedDescription ?? "")
                    return
                }
            }
        }
    }
    
    static public func sendLeaderboard(score: Int) async {
        Task{
            do {
                try await GKLeaderboard.submitScore(
                    score,
                    context: 0,
                    player: GKLocalPlayer.local,
                    leaderboardIDs: ["HighScore241126"]
                )
            } catch {
                print("Error on: \(#function): \(error.localizedDescription)")
            }
        }
    }
}
