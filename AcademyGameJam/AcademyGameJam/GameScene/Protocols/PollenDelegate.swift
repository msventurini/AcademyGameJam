//
//  PollenDelegate.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation

protocol PollenDelegate: AnyObject {
    func increasePollen(_ quantity: Float)
    func decreasePollen(_ quantity: Float)
    func dispersePollen(at position: CGPoint)
}
