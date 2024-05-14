//
//  CGSize+Math.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 14/05/24.
//

import Foundation
import CoreGraphics

extension CGSize {
    static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width + rhs, height: lhs.height + rhs)
    }
    
    static func + (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width - rhs, height: lhs.height - rhs)
    }
}
