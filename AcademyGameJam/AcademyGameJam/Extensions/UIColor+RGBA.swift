//
//  UIColor+RGBA.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import Foundation
import UIKit

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
    
    // TODO: Progress should a generic to any number
    func interpolate(to goal: UIColor, progress: CGFloat) -> UIColor {
        // (1.0 - progress) * red + progress * colorGoal.red
        
        let current = self.rgba
        let goal = goal.rgba
        
        let red = (1.0 - progress) * current.red + progress * goal.red
        let green = (1.0 - progress) * current.green + progress * goal.green
        let blue = (1.0 - progress) * current.blue + progress * goal.blue
        let alpha = (1.0 - progress) * current.alpha + progress * goal.alpha
        
        return .init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
