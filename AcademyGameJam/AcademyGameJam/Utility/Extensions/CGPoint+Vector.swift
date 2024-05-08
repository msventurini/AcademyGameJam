//
//  CGPoint+Vector.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 07/05/24.
//

import Foundation

extension CGPoint {
    public func distanceFromCGPoint(_ point: CGPoint) -> CGFloat {
        return sqrt(pow(self.x - point.x,2) + pow(self.y - point.y,2))
    }
    public func vector(to point: CGPoint) -> CGVector {
        return CGVector(dx: point.x - self.x, dy: point.y - self.y)
    }
    public func normalized() -> CGVector {
        let length = sqrt(x * x + y * y)
        return CGVector(dx: x / length, dy: y / length)
    }
}
