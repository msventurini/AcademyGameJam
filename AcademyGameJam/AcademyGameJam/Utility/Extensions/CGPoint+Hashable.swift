//
//  CGPoint+Hashable.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 13/05/24.
//

import Foundation
import CoreGraphics

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.x)
        hasher.combine(self.y)
    }
}
