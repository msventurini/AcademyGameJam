//
//  GS+PollenDelegate.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

extension GameScene: PollenDelegate {
    func increasePollen(_ quantity: Float) {
        pollen += quantity
    }
        
    func decreasePollen(_ quantity: Float) {
        pollen -= quantity
    }
    
    func dispersePollen(at position: CGPoint) {
        // TODO: Disperse the f*ing pollen
    }
}
