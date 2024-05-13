//
//  PlayerDelegate.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 08/05/24.
//

import Foundation

protocol PlayerDelegate: AnyObject {
    var player: Player? { get }
    func changePlayerMovementSpeed(by multiplier: CGFloat)
    func resetPlayerMovementSpeed()
}
