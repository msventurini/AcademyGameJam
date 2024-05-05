//
//  Sizeable.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import SpriteKit

protocol Sizeable {
    var size: CGSize { get }
}

extension SKSpriteNode: Sizeable {}
