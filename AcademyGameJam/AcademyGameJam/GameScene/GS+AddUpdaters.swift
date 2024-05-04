//
//  WS+AddUpdaters.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func addUpdaters() {
        addTimerUpdater()
    }
    
    func cancelUpdaters() {
        self.cancellables.removeAll()
    }
    
    private func addTimerUpdater() {
        let publisher = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
        let subscription = publisher
        
        subscription
            .sink { [self] _ in
                
                self.timer += 1
                print("timer: \(timer)")
                
            }.store(in: &cancellables)
    }
}
