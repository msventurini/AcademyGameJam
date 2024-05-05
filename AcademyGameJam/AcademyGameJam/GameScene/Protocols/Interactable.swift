//
//  InteractableNode.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

protocol Interactable {
    var interactionEnabled: Bool { get set }
    
    func interact()
    // TODO: Have a closure of what to do when interaction happens.
}
