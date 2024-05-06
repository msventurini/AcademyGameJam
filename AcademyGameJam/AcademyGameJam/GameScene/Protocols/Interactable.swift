//
//  InteractableNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

protocol Interactable {
    var interactionEnabled: Bool { get set }
    
    func startInteraction()
    func endInteraction()
}

extension Interactable {
    func startInteraction() {}
    func endInteraction() {}
}
