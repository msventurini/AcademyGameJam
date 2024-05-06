//
//  WS+AddUpdaters.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    internal func addUpdaters() {
        addTimerUpdater()
        addPollutionMovementUpdater()
    }
    
    internal func cancelUpdaters() {
        self.cancellables.removeAll()
    }
    
    private func addBirdSpawner() {
        let publisher = Timer
            .publish(every: 5, on: .main, in: .default)
            .autoconnect()
        
    }
    
    private func addTimerUpdater() {
        let publisher = Timer
            .publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
        
        let subscription = publisher
        subscription
            .sink { [self] _ in
                if timer < 1 { return }
                self.timer -= 1
                
                if CGFloat.random(in: 0...1) < self.birdSpawnnerChance {
                    spawnBird()
                }
                
                if self.timer % 10 == 0 {
                    self.birdSpawnnerChance += .random(in: 0...0.2)
                }
            }
            .store(in: &cancellables)
    }
    
    private func addPollutionMovementUpdater() {
        let publisher = Timer
            .publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
        
        let subscription = publisher
        subscription
            .sink { [self] _ in
                
                guard let pollution = enemies[.pollution]?.first as? PollutionNode else { return }
                
                pollution.applyForce(towards: CGPoint(
                    x: CGFloat.random(in: bounds.minX...bounds.maxX),
                    y: CGFloat.random(in: bounds.minY...bounds.maxY)), withMagnitude: 50_000)
                
            }
            .store(in: &cancellables)
    }
}
