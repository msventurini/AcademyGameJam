//
//  InteractableNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

protocol Interactable {
    var interactionEnabled: Bool { get set }
    var hasProgressionBar: Bool { get }
    
    func startInteraction()
    func endInteraction()
}

extension Interactable {
    func startInteraction() {}
    func endInteraction() {}
}
