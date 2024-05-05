//
//  PhysicsCategory.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation

struct PhysicsCategory {
    static let general: UInt32 = 0x1 << 0 // PhysicsCategory zero colide com tudo
    static let player: UInt32 = 0x1 << 1
    //...
}