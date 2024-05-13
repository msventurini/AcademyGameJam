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
    
    func prepareInteraction()
    func startInteraction()
    func endInteraction()
}

extension Interactable {
    func prepareInteraction() {}
    func startInteraction() {}
    func endInteraction() {}
}
